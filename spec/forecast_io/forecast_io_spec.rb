require 'spec_helper'

describe Forecast::IO do
  describe '.forecast' do
    it 'should return a forecast for a given latitude, longitude' do
      VCR.use_cassette('forecast_for_latitude_longitide', record: :once) do
        Forecast::IO.api_key = 'this-is-an-api-key'
        forecast = Forecast::IO.forecast('37.8267','-122.423')
        forecast.should_not be_nil
        forecast.latitude.should == 37.8267
        forecast.longitude.should == -122.423
        forecast.daily.size.should == 3
        forecast.alerts.should be_nil
      end
    end
  end
end