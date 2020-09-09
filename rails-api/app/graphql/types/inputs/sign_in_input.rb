module Types
    module Inputs
      class SignInInput < BaseInputObject
        argument :email, String, required: true, description: "用户电子邮箱"
        argument :password, String, required: true, description: "最小8个最大72个字符"
      end
    end
  end