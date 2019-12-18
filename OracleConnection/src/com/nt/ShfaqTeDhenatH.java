package com.nt;

import java.sql.ResultSet;
import java.sql.Statement;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class ShfaqTeDhenatH {
	
	private Label hid = new Label("HID");
	private Label hidroStacioni = new Label("Emri i stacionit");
	private Label distancaNgaGryka = new Label("Distanca Nga Gryka");
	private Label dataKoha = new Label("Data dhe Koha");
	private Label sipUjeMbledhese = new Label("Siperfaqja Ujembledhese");
	private Label niveliUjit = new Label("Niveli i ujit");
	private Label prurjaUjit = new Label("Prurja e ujit");
	
	
	public void createStage()
	{
		Stage primaryStage = new Stage();
		GridPane gpane = new GridPane();
		hid.setId("Hid");
		hidroStacioni.setId("hidroStacioni");
		dataKoha.setId("dataKoha");
		distancaNgaGryka.setId("distancaNgaGryka");
		sipUjeMbledhese.setId("sipUjeMbledhese");
		niveliUjit.setId("niveliUjit");
		prurjaUjit.setId("prurjaUjit");

		try {
			Statement st = DBConnection.getConnection().createStatement();
			ResultSet rs = st.executeQuery("Select * from Te_DhenatH_View");
			gpane.addRow(0, hid, hidroStacioni, distancaNgaGryka, dataKoha, sipUjeMbledhese, niveliUjit, prurjaUjit);

			while(rs.next())
			{
				gpane.addColumn(0, new Label(String.valueOf(rs.getInt(1))));
				gpane.addColumn(1, new Label(String.valueOf(rs.getString(2))));
				gpane.addColumn(2, new Label(String.valueOf(rs.getDouble(3))));
				gpane.addColumn(3, new Label(String.valueOf(rs.getDouble(4))));
				gpane.addColumn(4, new Label(String.valueOf(rs.getString(5))));
				gpane.addColumn(5, new Label(String.valueOf(rs.getInt(6))));
				gpane.addColumn(6, new Label(String.valueOf(rs.getDouble(7))));
				gpane.setHgap(80);
				gpane.setVgap(20);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		Scene scene = new Scene(gpane);
	    scene.getStylesheets().addAll(this.getClass().getResource("shfaqTeDhenat.css").toExternalForm());
	    gpane.setStyle("-fx-background-image: url(images/shfaqTeDhenatH.jpg);-fx-background-size:cover;-fx-opacity:1");
	    gpane.setPadding(new Insets(10, 10, 10, 10));
		primaryStage.setScene(scene);
		primaryStage.setTitle("Te Dhenat Hidrometrike");
		primaryStage.show();
		
	}
		

	public static void main(String[] args) {
		
		Application.launch(args);
	}
}
