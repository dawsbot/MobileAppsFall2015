package com.example.dawsonbotsford.final_botsford;

import android.content.Intent;
import android.provider.MediaStore;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    //Get's the name for this pizza from the edit text at top of app
    private String getPizzaName(){
        EditText pizza_Name_EditText = (EditText) findViewById(R.id.pizzaName);
        return pizza_Name_EditText.getText().toString();
    }

    //Get's the user's choice for gluten free or not from the slider
    private String getGlutenFree(){
        Switch gf_Switch = (Switch) findViewById(R.id.gluten_free);
        boolean choice = gf_Switch.isChecked();

        if (choice) {
            return "gluten-free";
        }
        else {
            return "GLUTEN";
        }
    }

    //Get's the user's choice for white or red sauce from the toggle button
    private String getSauce(){
        ToggleButton sauce_Button = (ToggleButton) findViewById(R.id.sauce_color);
        return sauce_Button.getText().toString();
    }

    //Get the user's choice for pizza size from the Spinner
    private String getSize(){
        Spinner size_Spinner = (Spinner) findViewById(R.id.size_spinner);
        return size_Spinner.getSelectedItem().toString();
    }

    //Get the user's choice for crust thickness from the radio group
    private String getCrustThickness() {
        RadioGroup crust_Radio = (RadioGroup) findViewById(R.id.thickness_radio);
        switch (crust_Radio.getCheckedRadioButtonId()){
            case R.id.thin_crust:
                return "thin";
            default:
                return "thick";
        }
    }

    public void buildPizza(View v){
        String phrase;

        phrase = "Your " + getSize() + " pizza is called the " + getPizzaName() + ". It is a " + getCrustThickness() + " crust pizza and has " + getSauce() + ". It is clearly healthy because it is a " + getGlutenFree() + " pizza.";

        TextView final_phrase_EditText = (TextView) findViewById(R.id.finalPhrase);
        final_phrase_EditText.setText(phrase);

    }


    private PizzaShop myShop = new PizzaShop();

    public void suggestShop(View view) {

        String thickness = getCrustThickness();

        if (thickness == "thin") {
            myShop.setPizzaShop("Pizzeria Locale");
            myShop.setGetPizzaShopURL("http://localeboulder.com");
        }
        else {
            myShop.setPizzaShop("Old C's");
            myShop.setGetPizzaShopURL("http://oldchicago.com");
        }

        Intent intent = new Intent(this, ReceiveShop.class);

        intent.putExtra("pizzaShopName", myShop.getPizzaShop());
        intent.putExtra("pizzaShopURL", myShop.getGetPizzaShopURL());

        startActivity(intent);
    }
}
