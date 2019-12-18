package com.nt;

import java.sql.ResultSet;
import java.sql.Statement;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class ShfaqTeDhenatK{
	
	private Label kid = new Label("KID");
	private Label stacioni = new Label("Emri i stacionit");
	private Label dataKoha = new Label("Data dhe Koha");
	private Label temp = new Label("Temperatura");
	private Label shtypjaAjrit = new Label("Shtypja e Ajrit");
	private Label lageshtiaAjrit = new Label("Lageshtia e Ajrit");
	private Label reshjeShiu = new Label("Reshjet e shiut");
	private Label reshjeBore = new Label("Reshjet e Bores");
	private Label insolacioni = new Label("Insolacioni");
	private Label vranesirat = new Label("Vranesirat");
	
	public void createStage()
	{
		Stage primaryStage = new Stage();
		GridPane gpane = new GridPane();
		kid.setId("KID");
		stacioni.setId("StacioniID");
		dataKoha.setId("dataKoha");
		temp.setId("temp");
		shtypjaAjrit.setId("shtypjaAjrit");
		lageshtiaAjrit.setId("lageshtiaAjrit");
		reshjeShiu.setId("reshjeShiu");
		reshjeBore.setId("reshjeBore");
		insolacioni.setId("insolacioni");
		vranesirat.setId("vranesirat");
		try {
			Statement st = DBConnection.getConnection().createStatement();
			ResultSet rs = st.executeQuery("Select * from Te_DhenatK_View");
			gpane.addRow(0, kid, stacioni, dataKoha, temp, shtypjaAjrit, lageshtiaAjrit, reshjeShiu, reshjeBore, insolacioni, vranesirat);

			while(rs.next())
			{
				gpane.addColumn(0, new Label(String.valueOf(rs.getInt(1))));
				gpane.addColumn(1, new Label(String.valueOf(rs.getString(2))));
				gpane.addColumn(2, new Label(String.valueOf(rs.getString(3))));
				gpane.addColumn(3, new Label(String.valueOf(rs.getDouble(4))));
				gpane.addColumn(4, new Label(String.valueOf(rs.getDouble(5))));
				gpane.addColumn(5, new Label(String.valueOf(rs.getDouble(6))));
				gpane.addColumn(6, new Label(String.valueOf(rs.getDouble(7))));
				gpane.addColumn(7, new Label(String.valueOf(rs.getDouble(8))));
				gpane.addColumn(8, new Label(String.valueOf(rs.getDouble(9))));
				gpane.addColumn(9, new Label(String.valueOf(rs.getDouble(10))));
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
	    gpane.setStyle("-fx-background-image: url(images/shfaqTeDhenat.jpg);-fx-background-size:cover;");
		primaryStage.setScene(scene);
		primaryStage.setTitle("Te Dhenat Klimatologjike");
		primaryStage.show();
		
	}
		

	public static void main(String[] args) {
		
		Application.launch(args);
	}
}
