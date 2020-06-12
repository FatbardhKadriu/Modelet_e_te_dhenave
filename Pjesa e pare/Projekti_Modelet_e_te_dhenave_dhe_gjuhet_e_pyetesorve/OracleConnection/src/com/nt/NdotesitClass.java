package com.nt;
import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.Scene;
import javafx.scene.chart.PieChart;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;

public class NdotesitClass{
public void createStage()
	{
		Stage primaryStage = new Stage();
		Pane pane = new Pane();
		pane.getChildren().add(createPieChart());
		Scene scene = new Scene(pane);
		primaryStage.setScene(scene);
		primaryStage.show();
	}
	public PieChart createPieChart() {

//		try {
//			Statement stmt = DBConnection.getConnection().createStatement();
//			ResultSet rs = stmt.executeQuery("Select * from NdotesitNeVende");
//			while(rs.next())
//			{
//				System.out.println(rs.getString(1) + " -> " + rs.getString(2));
//			}
//		}catch(Exception ex)
//		{
//			ex.printStackTrace();
//		}

		ObservableList<PieChart.Data> pieChartData =
                FXCollections.observableArrayList(
                new PieChart.Data("PM2.5", 7),
                new PieChart.Data("PM10", 13),
                new PieChart.Data("SO2", 39),
                new PieChart.Data("NO2", 11),
                new PieChart.Data("O3", 30));
        final PieChart chart = new PieChart(pieChartData);
        chart.setTitle("Ndotesite Ne Prishtine");
		return chart;
	}
}