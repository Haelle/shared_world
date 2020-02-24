# Untested class, but its usage are tested
class WithinTransaction
  def self.call((ctx, flow_options), *, &_block)
    last_semantic = 'failure'

    ActiveRecord::Base.transaction do
      step_result = yield

      last_semantic = step_result.first.as_json.dig('options', 'semantic')

      raise ActiveRecord::Rollback if last_semantic != 'success'
    end

    signal = last_semantic == 'success' ? Trailblazer::Operation::Railway.pass! : Trailblazer::Operation::Railway.fail!

    [signal, [ctx, flow_options]]
  end
end
