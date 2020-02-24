require 'rails_helper'

RSpec.describe SiegeMachine::Arm do
  subject { described_class.call siege_machine: siege_machine, character: character }

  context 'when arming went fine' do
    include_context 'basic game'

    it { is_expected.to be_success }

    it 'damages the castle' do
      expect { subject }.to change(castle, :health_points).by(-siege_machine.damages)
    end

    its([:siege_machine]) { is_expected.to eq siege_machine }
    its([:castle]) { is_expected.to eq siege_machine.camp.castle }

    it 'returns an updated castle' do
      updated_castle = subject[:castle]
      expect(updated_castle).to have_attributes health_points: 499
    end

    it 'persists a CharacterAction with expected values' do
      action = subject[:action]
      expect(action).to be_a CharacterAction
      expect(action).to be_persisted
      expect(action.character).to eq character
      expect(action.camp).to eq character.camp
      expect(action.action_type).to eq 'arm'
      expect(action.action_params).to eq('siege_machine' => siege_machine.as_json)
      expect(action.target).to eq castle
    end
  end

  context 'when castle is destroyed' do
    include_context 'basic game'

    before do
      castle.update health_points: 10
      siege_machine.update damages: 100
    end

    it { is_expected.to be_success }

    it 'change health points to 0' do
      expect(subject[:castle].health_points).to eq 0
    end

    it 'persists a CharacterAction with expected values' do
      action = subject[:action]
      expect(action).to be_a CharacterAction
      expect(action).to be_persisted
      expect(action.character).to eq character
      expect(action.camp).to eq character.camp
      expect(action.action_type).to eq 'arm'
      expect(action.action_params).to eq('siege_machine' => siege_machine.as_json)
      expect(action.target).to eq castle
    end
  end

  context 'when user does not belongs to same camp as the weapon' do
    let!(:camp) { create :camp }
    let!(:castle) { create :castle, camp: camp }
    let!(:siege_machine) { create :siege_machine, camp: camp }

    let(:another_camp) { create :camp }
    let(:character) { create :character, camp: another_camp }

    it_behaves_like 'interfering with another camp'

    it 'does not damage the castle' do
      expect { subject }.not_to change(castle, :health_points)
    end
  end

  context 'when arm callback failed' do
    include_context 'basic game'

    before do
      allow(castle).to receive(:save).and_return false
    end

    it { is_expected.to be_failure }

    it 'does not decrement character points'

    it 'does not damage the castle' do
      expect { subject; castle.reload }.not_to change(castle, :health_points)
    end

    its([:error]) { is_expected.to eq 'An error occurred during arm' }

    it 'does not persist a character action' do
      expect { subject }.not_to change(CharacterAction, :count)
    end
  end

  # TODO: exhausted shared example
  context 'when character is exhausted'
end
