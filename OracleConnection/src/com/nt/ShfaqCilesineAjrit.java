package com.nt;

import java.sql.ResultSet;
import java.sql.Statement;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class ShfaqCilesineAjrit{
	
	private Label aid = new Label("AID");
	private Label ndotesi = new Label("Ndotesi");
	private Label vendi = new Label("Vendi");
	private Label dataKoha = new Label("Data dhe Koha");
	private Label koncentrimi = new Label("KoncentrimiW");
	private Label vleraMax = new Label("Vlera max e lejuar");

	public void createStage()
	{
		Stage primaryStage = new Stage();
		GridPane gpane = new GridPane();
		aid.setId("aid");
		ndotesi.setId("ndotesi");
		koncentrimi.setId("koncentrimi");
		dataKoha.setId("dataKoha");
		vendi.setId("vendi");
		vleraMax.setId("vleraMax");
		try {
			Statement st = DBConnection.getConnection().createStatement();
			ResultSet rs = st.executeQuery("Select * from CilesiaAjrit_View");
			gpane.addRow(0, aid, vendi, ndotesi, dataKoha, koncentrimi, vleraMax);

			while(rs.next())
			{
				gpane.addColumn(0, new Label(String.valueOf(rs.getInt(1))));
				gpane.addColumn(1, new Label(String.valueOf(rs.getString(2))));
				gpane.addColumn(2, new Label(String.valueOf(rs.getString(3))));
				gpane.addColumn(3, new Label(String.valueOf(rs.getString(4))));
				gpane.addColumn(4, new Label(String.valueOf(rs.getInt(5))));
				gpane.addColumn(5, new Label(String.valueOf(rs.getInt(6))));
				gpane.setHgap(80);
				gpane.setVgap(20);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		Scene scene = new Scene(gpane);
	    scene.getStylesheets().addAll(this.getClass().getResource("shfaqTeDhenat.css").toExternalForm());
	    gpane.setPadding(new Insets(10, 10, 10, 10));
	    gpane.setStyle("-fx-background-image: url(images/ajri.jpg);");
		primaryStage.setScene(scene);
		primaryStage.setTitle("Cilesia e Ajrit");
		primaryStage.show();
		
	}
		

	public static void main(String[] args) {
		
		Application.launch(args);
	}
}
