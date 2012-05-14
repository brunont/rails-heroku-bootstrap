desc "Rename project"

task :rename, :project_name do |t, args|
  def replace_in_file(filename, s, r)
    filename = Rails.root.join(filename)
    content = File.open(filename).read.gsub(s, r)
    File.open(filename, "w") {|f| f.write(content) }
  end
  
  
  ['Rakefile',
  'app/views/layouts/application.slim',
  'config/application.rb',
  'config/environment.rb',
  'config/environments/development.rb',
  'config/environments/production.rb',
  'config/environments/test.rb',
  'config/initializers/secret_token.rb',
  'config/initializers/session_store.rb',
  'config/initializers/session_store.rb',
  'config/routes.rb',
  'config.ru',
  'lib/tasks/rename.rake'].each do |filename|
    replace_in_file(filename, 'PotenciaEmGrupo', args[:project_name].camelize)
  end
  
  replace_in_file('config/database.yml', 'PotenciaEmGrupo'.underscore, args[:project_name].underscore)
end