import React, { useState, useCallback } from 'react';
import { GoogleMap, useJsApiLoader, Marker } from '@react-google-maps/api';
import Geocode from 'react-geocode';
import Autocomplete from 'react-google-autocomplete';

// Set up your Google Maps API key here
const API_KEY = window.env.GOOGLE_MAPS_API_KEY;
Geocode.setApiKey(API_KEY);

const containerStyle = {
  width: '100%',
  height: '400px',
};

const LocationSelector = ({ onLocationSelect }) => {
  const [map, setMap] = useState(null);
  const [position, setPosition] = useState(null);
  const [address, setAddress] = useState('');

  const { isLoaded } = useJsApiLoader({
    googleMapsApiKey: API_KEY,
    libraries: ['places'],
  });

  const onLoad = useCallback((map) => {
    setMap(map);
  }, []);

  const onUnmount = useCallback((map) => {
    setMap(null);
  }, []);

  const handleGeolocation = () => {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          const { latitude, longitude } = position.coords;
          setPosition({ lat: latitude, lng: longitude });
          fetchAddress(latitude, longitude);
        },
        (error) => {
          console.error("Error getting location: ", error);
        }
      );
    } else {
      alert('Geolocation is not supported by this browser.');
    }
  };

  const handlePlaceSelected = (place) => {
    const { geometry } = place;
    if (geometry) {
      const { location } = geometry;
      const lat = location.lat();
      const lng = location.lng();
      setPosition({ lat, lng });
      setAddress(place.formatted_address);
      onLocationSelect({ lat, lng, address: place.formatted_address });
    }
  };

  const fetchAddress = (lat, lng) => {
    Geocode.fromLatLng(lat, lng).then(
      (response) => {
        const address = response.results[0].formatted_address;
        setAddress(address);
        onLocationSelect({ lat, lng, address });
      },
      (error) => {
        console.error("Error fetching address: ", error);
      }
    );
  };

  const handleMapClick = (event) => {
    const lat = event.latLng.lat();
    const lng = event.latLng.lng();
    setPosition({ lat, lng });
    fetchAddress(lat, lng);
  };

  return isLoaded ? (
    <div>
      <button onClick={handleGeolocation}>Get Current Location</button>

      <Autocomplete
        apiKey={API_KEY}
        style={{ width: '100%', margin: '20px 0' }}
        onPlaceSelected={handlePlaceSelected}
        types={['(regions)']}
      />

      <GoogleMap
        mapContainerStyle={containerStyle}
        center={position || { lat: -3.745, lng: -38.523 }}
        zoom={position ? 15 : 3}
        onLoad={onLoad}
        onUnmount={onUnmount}
        onClick={handleMapClick}
      >
        {position && <Marker position={position} />}
      </GoogleMap>

      <div>
        <p><strong>Address:</strong> {address}</p>
        {position && (
          <p><strong>Latitude:</strong> {position.lat}, <strong>Longitude:</strong> {position.lng}</p>
        )}
      </div>
    </div>
  ) : <p>Loading...</p>;
};

export default LocationSelector;