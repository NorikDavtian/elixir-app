# In this file, we load production configuration and
# secrets from environment variables. You can also
# hardcode secrets, although such is generally not
# recommended and you have to remember to add this
# file to your .gitignore.
use Mix.Config

# database_url =
#   System.get_env("DATABASE_URL") ||
#     raise """
#     environment variable DATABASE_URL is missing.
#     For example: ecto://USER:PASS@HOST/DATABASE
#     """
# Configure your database
config :hello, Hello.Repo,
  username: "postgres",
  password: "root",
  database: "hello_prod",
  socket_dir: "/tmp/cloudsql/babycrm-1560367321017:us-central1:hellodb",
  pool_size: 15

config :hello, HelloWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "4000")]
