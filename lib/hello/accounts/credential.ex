defmodule Hello.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Accounts.User

  schema "credentials" do
    field :email, :string
    field :passwd, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:email, :passwd])
    |> validate_required([:email, :passwd])
    |> unique_constraint(:email)
  end
end
