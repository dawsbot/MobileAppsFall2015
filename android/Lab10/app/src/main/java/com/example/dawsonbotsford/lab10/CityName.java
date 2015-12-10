package com.example.dawsonbotsford.lab10;

/**
 * Created by dawsonbotsford on 12/9/15.
 */
public class CityName {
    private String CityName;
    private String CityURL;

    public void setCityName(int id) {
        switch (id){
            case R.id.sfButton:
                CityName = "San Francisco, CA";
                CityURL = "https://en.wikipedia.org/wiki/San_Francisco";
                break;
            case R.id.boulderButton:
                CityName = "Boulder, CO";
                CityURL = "https://en.wikipedia.org/wiki/Boulder";
                break;
            default:
                CityName = "San Francisco, CA";
                CityURL = "https://en.wikipedia.org/wiki/San_Francisco";
                break;
        }
        System.out.println (CityName);
        System.out.println (CityURL);

    }
    public String getCityName() {
        return CityName;
    }

    public String getCityURL() {
        return CityURL;
    }


}
