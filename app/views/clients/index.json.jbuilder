json.array!(@clients) do |client|
  json.extract! client, :id, :cedula, :nombres, :direccion, :telefono, :correo
  json.url client_url(client, format: :json)
end
