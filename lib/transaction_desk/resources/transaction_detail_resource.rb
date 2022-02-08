module TransactionDesk
  class TransactionDetailResource < ResourceKit::Resource
    include ErrorHandlingResourcable

    resources do

      # GET /transactions/:transaction_id/details
      action :find do
        verb :get
        path "#{TransactionDesk.configuration.path_url}/transactions/:transaction_id/details"
        handler(200) { |response| TransactionDetailMapping.extract_single(response.body, :read) }
      end

      # PATCH /transactions/:transaction_id/details
      action :update do
        verb :patch
        body do |object|
          proc = Proc.new { |k, v| v.kind_of?(Hash) ? (v.delete_if(&proc); nil) : v.nil? }
          TransactionDetailMapping.hash_for(:update, object).delete_if(&proc).to_json
        end
        path "#{TransactionDesk.configuration.path_url}/transactions/:transaction_id/details"
        handler(200) { |_| true }
      end

    end

  end
end
