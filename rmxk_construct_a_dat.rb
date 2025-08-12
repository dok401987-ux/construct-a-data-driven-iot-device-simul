# RMXK Construct a Data-Driven IoT Device Simulator

# Load necessary libraries
require 'json'
require 'securerandom'
require 'time'

# IoT Device Simulator class
class IoTDeviceSimulator
  attr_accessor :device_id, :device_type, :data_points

  def initialize(device_type, num_data_points)
    @device_id = SecureRandom.uuid
    @device_type = device_type
    @data_points = generate_data_points(num_data_points)
  end

  def generate_data_points(num_points)
    points = []
    num_points.times do
      points << {
        timestamp: Time.now.to_i,
        temperature: rand(0..50),
        humidity: rand(0..100),
        pressure: rand(900..1100)
      }
    end
    points
  end

  def simulate_data_transmission
    # Simulate data transmission to a server or cloud platform
    puts "Device #{@device_id} (#{@device_type}) transmitting data..."
    puts JSON.pretty_generate(@data_points)
  end
end

# Example usage
device = IoTDeviceSimulator.new('TemperatureSensor', 10)
device.simulate_data_transmission