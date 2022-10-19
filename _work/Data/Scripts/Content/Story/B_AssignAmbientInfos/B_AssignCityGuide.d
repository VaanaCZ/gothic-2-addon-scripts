// ****************************
// Wegbescreibungenin der Stadt
// ****************************


func void B_AddCityGuideChoices()
{
	Info_ClearChoices (DIA_CITYGUIDE);
	
	if (!C_IsQuarterNearest(self, Q_UNTERSTADT))
	{
		Info_AddChoice (DIA_CITYGUIDE, "In die Unterstadt.", DIA_CITYGUIDE_UNTERSTADT);
	};
	if (!C_IsQuarterNearest(self, Q_OBERSTADT))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Ins obere Viertel.", DIA_CITYGUIDE_OBERSTADT);
	};
	if (!C_IsQuarterNearest(self, Q_TEMPEL))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Zum Adanos-Tempel", DIA_CITYGUIDE_TEMPEL);
	};
	if (!C_IsQuarterNearest(self, Q_MARKT))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Zum Marktplatz.", DIA_CITYGUIDE_MARKT);
	};
	if (!C_IsQuarterNearest(self, Q_GALGEN))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Zum Galgenplatz", DIA_CITYGUIDE_GALGEN);
	};
	if (!C_IsQuarterNearest(self, Q_KASERNE))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Zur Kaserne.", DIA_CITYGUIDE_KASERNE);
	};
	if (!C_IsQuarterNearest(self, Q_HAFEN))
	{
		Info_AddChoice (DIA_CITYGUIDE, "Ins Hafenviertel.", DIA_CITYGUIDE_HAFEN);
	};
	
	Info_AddChoice (DIA_CITYGUIDE, "Danke - das war alles, was ich wissen wollte!", DIA_CITYGUIDE_BACK);
};

INSTANCE DIA_CITYGUIDE (C_INFO)
{
	nr			= 700;
	condition	= DIA_CITYGUIDE_Condition;
	information	= DIA_CITYGUIDE_Info;
	permanent	= TRUE;
	description = "Kannst du mir helfen, mich hier zurechtzufinden?";
};                       

FUNC INT DIA_CITYGUIDE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_CITYGUIDE_Info()
{	
	AI_Output (other, self, "DIA_CITYGUIDE_15_00"); //Kannst du mir helfen, mich hier zurechtzufinden?
	
	// ------ Du bist jetzt ------
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT"); 	//Du bist jetzt in der Unterstadt.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT");		//Du bist jetzt in der Oberstadt.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL");			//Du bist jetzt am Tempel.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT");			//Du bist jetzt am Marktplatz.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN");			//Du bist jetzt am Galgenplatz vor der Kaserne.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE");		//Das hier ist die Kaserne.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN");			//Du bist hier im Hafenviertel.
	};
	
	B_Say (self, other, "$WHERETO"); //Wo willst du hin?
	
	B_AddCityGuideChoices();
};

func void DIA_CITYGUIDE_BACK()
{
	AI_Output (other, self, "DIA_CITYGUIDE_BACK_15_00"); //Danke - das war alles, was ich wissen wollte!
	Info_ClearChoices (DIA_CITYGUIDE);
};
	
func void DIA_CITYGUIDE_UNTERSTADT()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_UNTERSTADT_15_00"); //Wie komme ich in die Unterstadt?
	
	if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); //Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.	
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_TEMPEL"); 		//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlang gehst, kommst du zum Tempel.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.	
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//Geh vom Galgenplatz aus die Gasse runter und du komst zum Tempelplatz.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_GALGEN"); 		//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz. 
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//Geh vom Galgenplatz aus die Gasse runter und du komst zum Tempelplatz.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//Geh von der Kaimauer aus die Hafenstrasse hoch, dann kommst du in die Unterstadt.
	};
	
	B_AddCityGuideChoices();
};

func void DIA_CITYGUIDE_OBERSTADT()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_OBERSTADT_15_00"); //Wie komme ich ins obere Viertel?
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Am südlichen Stadttor gibt es eine Treppe die zum innere Stadttor hoch führt. Dort beginnt die Oberstadt.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Am südlichen Stadttor gibt es eine Treppe die zum innere Stadttor hoch führt. Dort beginnt die Oberstadt.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_TEMPEL"); 		//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlang gehst, kommst du zum Tempel.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Am südlichen Stadttor gibt es eine Treppe die zum innere Stadttor hoch führt. Dort beginnt die Oberstadt.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//Geh vom Galgenplatz aus die Gasse runter und du komst zum Tempelplatz.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Am südlichen Stadttor gibt es eine Treppe die zum innere Stadttor hoch führt. Dort beginnt die Oberstadt.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_GALGEN"); 		//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz. 
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//Geh vom Galgenplatz aus die Gasse runter und du komst zum Tempelplatz.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Am südlichen Stadttor gibt es eine Treppe die zum innere Stadttor hoch führt. Dort beginnt die Oberstadt.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//Geh von der Kaimauer aus die Hafenstrasse hoch, dann kommst du in die Unterstadt.
		B_Say (self, other, "$UNTERSTADT_2_OBERSTADT"); //Am südlichen Stadttor gibt es eine Treppe die zum innere Stadttor hoch führt. Dort beginnt die Oberstadt.
	};
	
	B_AddCityGuideChoices();
};
	
func void DIA_CITYGUIDE_TEMPEL()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_TEMPEL_15_00"); //Ich suche den Tempel.
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.	
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); //Geh von hier aus durch das innere Stadttor und du kommst in die Unterstadt.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.	
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_TEMPEL"); 		//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlang gehst, kommst du zum Tempel.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//Geh vom Galgenplatz aus die Gasse runter und du komst zum Tempelplatz.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_MARKT"); 		//Geh einfach die Treppe am Haupteingang links runter, dann kommst du zum Markt. 
		B_Say (self, other, "$MARKT_2_TEMPEL"); 		//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlang gehst, kommst du zum Tempel.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//Geh von der Kaimauer aus die Hafenstrasse hoch, dann kommst du in die Unterstadt.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.	
	};
	
	B_AddCityGuideChoices();
};
	
func void DIA_CITYGUIDE_MARKT()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_MARKT_15_00"); //Wo ist der Marktplatz?
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.	
		B_Say (self, other, "$TEMPEL_2_MARKT"); 		//Wenn du vorm Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); //Geh von hier aus durchdas innere Stadttor und du kommst in die Unterstadt.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.	
		B_Say (self, other, "$TEMPEL_2_MARKT"); 		//Wenn du vorm Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_MARKT"); 		//Wenn du vorm Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_MARKT"); 		//Geh einfach an der großen Kaserne entlang und du kommst zum Markt.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_MARKT"); 		//Geh einfach die Treppe am Haupteingang runter und dann links.
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//Geh von der Kaimauer aus die Hafenstrasse hoch, dann kommst du in die Unterstadt.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.	
		B_Say (self, other, "$TEMPEL_2_MARKT"); 		//Wenn du vorm Tempel stehst, geh links hoch und an der Stadtmauer entlang, dann kommst du zum Markt.
	};
	
	B_AddCityGuideChoices();
};
	
func void DIA_CITYGUIDE_GALGEN()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_GALGEN_15_00"); //Wie komme ich zum Galgenplatz?
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.	
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Wenn du vom Tempel aus gesehen links an der Kneipe vorbei gehst, kommst du zum Galgenplatz.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); //Geh von hier aus durchdas innere Stadttor und du kommst in die Unterstadt.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.	
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Wenn du vom Tempel aus gesehen links an der Kneipe vorbei gehst, kommst du zum Galgenplatz.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Wenn du vom Tempel aus gesehen links an der Kneipe vorbei gehst, kommst du zum Galgenplatz.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_GALGEN"); 		//Geh einfach an der großen Kaserne entlang und du kommst zum Galgenplatz.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_GALGEN"); 		//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz. 
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//Geh von der Kaimauer aus die Hafenstrasse hoch, dann kommst du in die Unterstadt.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.	
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Wenn du vom Tempel aus gesehen links an der Kneipe vorbei gehst, kommst du zum Galgenplatz.
	};
	
	B_AddCityGuideChoices();
};
	
func void DIA_CITYGUIDE_KASERNE()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_KASERNE_15_00"); //Wo ist die Kaserne?
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.	
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Wenn du vom Tempel aus gesehen links an der Kneipe vorbei gehst, kommst du zum Galgenplatz.
		B_Say (self, other, "$GALGEN_2_KASERNE");		//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); 	//Geh von hier aus durchdas innere Stadttor und du kommst in die Unterstadt.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.	
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Wenn du vom Tempel aus gesehen links an der Kneipe vorbei gehst, kommst du zum Galgenplatz.
		B_Say (self, other, "$GALGEN_2_KASERNE");		//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Wenn du vom Tempel aus gesehen links an der Kneipe vorbei gehst, kommst du zum Galgenplatz.
		B_Say (self, other, "$GALGEN_2_KASERNE");		//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_KASERNE");		//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen gegenüber dem Hotel rauf.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_KASERNE");		//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf. 
	}
	else if (C_NpcIsInQuarter(self) == Q_HAFEN)
	{
		B_Say (self, other, "$HAFEN_2_UNTERSTADT");		//Geh von der Kaimauer aus die Hafenstrasse hoch, dann kommst du in die Unterstadt.
		B_Say (self, other, "$UNTERSTADT_2_TEMPEL");	//Geh vom Schmied aus durch die Unterführung und du kommst zum Tempelplatz.	
		B_Say (self, other, "$TEMPEL_2_GALGEN"); 		//Wenn du vom Tempel aus gesehen links an der Kneipe vorbei gehst, kommst du zum Galgenplatz.
		B_Say (self, other, "$GALGEN_2_KASERNE");		//Die Kaserne ist das riesengroße Gebäude. Geh einfach die Treppen rauf.
	};
	
	B_AddCityGuideChoices();
};
	
func void DIA_CITYGUIDE_HAFEN()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_HAFEN_15_00"); //Wo ist das Hafenviertel?
	
	if (C_NpcIsInQuarter(self) == Q_UNTERSTADT)
	{
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//Geh vom Schmied aus die Hafenstrasse runter, dann kommst du zum Hafen.
	}
	else if (C_NpcIsInQuarter(self) == Q_OBERSTADT)
	{
		B_Say (self, other, "$OBERSTADT_2_UNTERSTADT"); //Geh von hier aus durchdas innere Stadttor und du kommst in die Unterstadt.
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//Geh vom Schmied aus die Hafenstrasse runter, dann kommst du zum Hafen.
	}
	else if (C_NpcIsInQuarter(self) == Q_TEMPEL)
	{
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//Geh vom Schmied aus die Hafenstrasse runter, dann kommst du zum Hafen.
	}
	else if (C_NpcIsInQuarter(self) == Q_MARKT)
	{
		B_Say (self, other, "$MARKT_2_TEMPEL"); 		//Wenn du vom Marktplatz aus an der hohen Stadtmauer entlang gehst, kommst du zum Tempel.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//Geh vom Schmied aus die Hafenstrasse runter, dann kommst du zum Hafen.
	}
	else if (C_NpcIsInQuarter(self) == Q_GALGEN)
	{
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//Geh vom Galgenplatz aus die Gasse runter und du komst zum Tempelplatz.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//Geh vom Schmied aus die Hafenstrasse runter, dann kommst du zum Hafen.
	}
	else if (C_NpcIsInQuarter(self) == Q_KASERNE)
	{
		B_Say (self, other, "$KASERNE_2_GALGEN"); 		//Geh einfach die Treppe am Haupteingang rechts runter, dann kommst du zum Galgenplatz. 
		B_Say (self, other, "$GALGEN_2_TEMPEL"); 		//Geh vom Galgenplatz aus die Gasse runter und du komst zum Tempelplatz.
		B_Say (self, other, "$TEMPEL_2_UNTERSTADT");	//Vom Tempelplatz aus gibt es eine Unterführung, die in die Unterstadt führt.
		B_Say (self, other, "$UNTERSTADT_2_HAFEN");		//Geh vom Schmied aus die Hafenstrasse runter, dann kommst du zum Hafen.
	};
	
	B_AddCityGuideChoices();
};

// *********************************************************
// ---------------------------------------------------------

func void B_AssignCityGuide (var C_NPC slf)
{
	DIA_CITYGUIDE.npc = Hlp_GetInstanceID(slf);
};

	
	


