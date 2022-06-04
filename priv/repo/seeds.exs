# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TravelLinesManagement.Repo.insert!(%TravelLinesManagement.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TravelLinesManagement.Repo
alias TravelLinesManagement.Trip.Vehicle
alias TravelLinesManagement.Trip.Line
alias TravelLinesManagement.Trip.Stop
alias TravelLinesManagement.Trip.Travel

Repo.insert! %Vehicle{
  plate: "ABCDE1234",
  status: 1
}

Repo.insert! %Line{
  name: "12",
  description: "Reliant les villes de Niort et Parthenay",
  status: 1
}

Repo.insert! %Stop{
  line_id: 1,
  city_name: "Niort",
  name: "Gare SNCF",
  order: 1,
  time: Time.truncate(~T[05:50:00.00], :second),
  status: 1
}

Repo.insert! %Stop{
  line_id: 1,
  city_name: "Niort",
  name: "Pl. de la Brèche",
  order: 2,
  time: Time.truncate(~T[05:55:00.00], :second),
  status: 1
}

Repo.insert! %Stop{
  line_id: 1,
  city_name: "St-Christophe-sur-Roc",
  name: "Montplaisir",
  order: 3,
  time: Time.truncate(~T[06:13:00.00], :second),
  status: 1
}

Repo.insert! %Stop{
  line_id: 1,
  city_name: "Mazières-en-Gâtine",
  name: "Place des Marronniers",
  order: 4,
  time: Time.truncate(~T[06:22:00.00], :second),
  status: 1
}

Repo.insert! %Stop{
  line_id: 1,
  city_name: "St-Pardoux-Soutiers	",
  name: "Rambaudières",
  order: 5,
  time: Time.truncate(~T[06:30:00.00], :second),
  status: 1
}

Repo.insert! %Stop{
  line_id: 1,
  city_name: "Parthenay",
  name: "Base de Loisirs",
  order: 6,
  time: Time.truncate(~T[06:36:00.00], :second),
  status: 1
}

Repo.insert! %Stop{
  line_id: 1,
  city_name: "Parthenay",
  name: "Av. François Mitterrand",
  order: 7,
  time: Time.truncate(~T[06:38:00.00], :second),
  status: 1
}

Repo.insert! %Stop{
  line_id: 1,
  city_name: "Parthenay",
  name: "Gare routière	",
  order: 8,
  time: Time.truncate(~T[06:40:00.00], :second),
  status: 1
}

Repo.insert! %Travel{
  line_id: 1,
  vehicle_id: 1,
  status: 1
}
