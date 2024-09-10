defmodule FoodTrucks.InitData.Parser do
  @moduledoc """
  Contains TruckData fields
  """

  @derive Jason.Encoder
  defstruct [
    :__raw__,
    :__hash__,
    :locationid,
    :applicant,
    :facility_type,
    :cnn,
    :location_description,
    :address,
    :blocklot,
    :block,
    :lot,
    :permit,
    :status,
    :food_items,
    :x,
    :y,
    :latitude,
    :longitude,
    :schedule,
    :dayshours,
    :noi_sent,
    :approved,
    :received,
    :prior_permit,
    :expiration_date,
    :location,
    :fire_prevention_districts,
    :police_districts,
    :supervisor_districts,
    :zip_codes,
    :neighborhoods_old
  ]

  @type t :: %__MODULE__{
          __raw__: [String.t()],
          __hash__: String.t(),
          locationid: String.t(),
          applicant: String.t(),
          facility_type: String.t(),
          cnn: String.t(),
          location_description: String.t(),
          address: String.t(),
          blocklot: String.t(),
          block: String.t(),
          lot: String.t(),
          permit: String.t(),
          status: String.t(),
          food_items: String.t(),
          x: String.t(),
          y: String.t(),
          latitude: String.t(),
          longitude: String.t(),
          schedule: String.t(),
          dayshours: String.t(),
          noi_sent: String.t(),
          approved: String.t(),
          received: String.t(),
          prior_permit: String.t(),
          expiration_date: String.t(),
          location: String.t(),
          fire_prevention_districts: String.t(),
          police_districts: String.t(),
          supervisor_districts: String.t(),
          zip_codes: String.t(),
          neighborhoods_old: String.t()
        }

  @doc """
  If a header is present, this is what it should be.
  """
  def expected_header,
    do:
      "locationid,Applicant,FacilityType,cnn,LocationDescription,Address,blocklot,block,lot,permit,Status,FoodItems,X,Y,Latitude,Longitude,Schedule,dayshours,NOISent,Approved,Received,PriorPermit,ExpirationDate,Location,Fire Prevention Districts,Police Districts,Supervisor Districts,Zip Codes,Neighborhoods (old)"

  @doc """
  Parse a file using streams.
  """
  @spec stream(String.t()) :: Enumerable.t()
  def stream(filename) when is_binary(filename) do
    filename
    |> File.stream!()
    |> NimbleCSV.RFC4180.parse_stream(skip_headers: true)
    |> Stream.map(&parse_line/1)
  end

  defp parse_line(row) do
    [
      locationid,
      applicant,
      facility_type,
      cnn,
      location_description,
      address,
      blocklot,
      block,
      lot,
      permit,
      status,
      food_items,
      x,
      y,
      latitude,
      longitude,
      schedule,
      dayshours,
      noi_sent,
      approved,
      received,
      prior_permit,
      expiration_date,
      location,
      fire_prevention_districts,
      police_districts,
      supervisor_districts,
      zip_codes,
      neighborhoods_old
    ] = row

    %__MODULE__{
      __raw__: row,
      __hash__: :sha256 |> :crypto.hash(row) |> Base.encode64(),
      locationid: value_or_nil(locationid),
      applicant: value_or_nil(applicant),
      facility_type: value_or_nil(facility_type),
      cnn: value_or_nil(cnn),
      location_description: value_or_nil(location_description),
      address: value_or_nil(address),
      blocklot: value_or_nil(blocklot),
      block: value_or_nil(block),
      lot: value_or_nil(lot),
      permit: value_or_nil(permit),
      status: value_or_nil(status),
      food_items: value_or_nil(food_items),
      x: value_or_nil(x),
      y: value_or_nil(y),
      latitude: value_or_nil(latitude),
      longitude: value_or_nil(longitude),
      schedule: value_or_nil(schedule),
      dayshours: value_or_nil(dayshours),
      noi_sent: value_or_nil(noi_sent),
      approved: value_or_nil(approved),
      received: value_or_nil(received),
      prior_permit: value_or_nil(prior_permit),
      expiration_date: value_or_nil(expiration_date),
      location: value_or_nil(location),
      fire_prevention_districts: value_or_nil(fire_prevention_districts),
      police_districts: value_or_nil(police_districts),
      supervisor_districts: value_or_nil(supervisor_districts),
      zip_codes: value_or_nil(zip_codes),
      neighborhoods_old: value_or_nil(neighborhoods_old)
    }
  end

  defp value_or_nil(""), do: nil
  defp value_or_nil(value), do: value
end
