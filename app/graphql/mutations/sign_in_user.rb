module Mutations
  class SignInuser < BaseMutation

    argument :credentials, Types::AuthProviderCredentialsInput
  end
end
