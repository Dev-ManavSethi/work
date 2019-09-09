class Teacher < ApplicationRecord
  validates :id, :name, :dob, :exp, presence:true
  validates :id, format: {with: /[T][C][H][R]-\w/, message: "Expression: [A-Z][A-Z]-\w"}
  validates :name, length:{maximun:30, minimum:2, too_long:"", too_short:""}
  validates :dob, format:{with: /\d{4}-\d{2}-\d{2}/, message:"Invalid date pattern, required: yyyy-mm-dd"}, length:{is:10}
  validates :exp , numericality:{only_integer: true, greater_than_or_equal_to:0}
end
