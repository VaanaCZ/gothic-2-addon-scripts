// ****************************
// Wegbescreibungenin der Stadt
// ****************************


func void B_AddCityGuideChoices()
{
	Info_ClearChoices (DIA_CITYGUIDE);
	
	if (!C_IsQuarterNearest(self, Q_UNTERSTADT))
	{
		Info_AddChoice (DIA_CITYGUIDE, "To the lower part of town.", DIA_CITYGUIDE_UNTERSTADT);
	};
	if (!C_IsQuarterNearest(self, Q_OBERSTADT))
	{
		Info_AddChoice (DIA_CITYGUIDE, "To the upper quarter.", DIA_CITYGUIDE_OBERSTADT);
	};
	if (!C_IsQuarterNearest(self, Q_TEMPEL))
	{
		Info_AddChoice (DIA_CITYGUIDE, "To the temple of Adanos.", DIA_CITYGUIDE_TEMPEL);
	};
	if (!C_IsQuarterNearest(self, Q_MARKT))
	{
		Info_AddChoice (DIA_CITYGUIDE, "To the marketplace.", DIA_CITYGUIDE_MARKT);
	};
	if (!C_IsQuarterNearest(self, Q_GALGEN))
	{
		Info_AddChoice (DIA_CITYGUIDE, "To the gallows square.", DIA_CITYGUIDE_GALGEN);
	};
	if (!C_IsQuarterNearest(self, Q_KASERNE))
	{
		Info_AddChoice (DIA_CITYGUIDE, "To the barracks.", DIA_CITYGUIDE_KASERNE);
	};
	if (!C_IsQuarterNearest(self, Q_HAFEN))
	{
		Info_AddChoice (DIA_CITYGUIDE, "To the harbor district.", DIA_CITYGUIDE_HAFEN);
	};
	
	Info_AddChoice (DIA_CITYGUIDE, "Thanks - that was all I wanted to know!", DIA_CITYGUIDE_BACK);
};

INSTANCE DIA_CITYGUIDE (C_INFO)
{
	nr			= 700;
	condition	= DIA_CITYGUIDE_Condition;
	information	= DIA_CITYGUIDE_Info;
	permanent	= TRUE;
	description = "What can you tell me about this area?";
};                       

FUNC INT DIA_CITYGUIDE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_CITYGUIDE_Info()
{	
	AI_Output (other, self, "DIA_CITYGUIDE_15_00"); //What's new?
	
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
	AI_Output (other, self, "DIA_CITYGUIDE_BACK_15_00"); //Thanks - that was all I wanted to know!
	Info_ClearChoices (DIA_CITYGUIDE);
};
	
func void DIA_CITYGUIDE_UNTERSTADT()	
{
	AI_Output (other, self, "DIA_CITYGUIDE_UNTERSTADT_15_00"); //How do I get to the lower part of town?
	
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
	AI_Output (other, self, "DIA_CITYGUIDE_OBERSTADT_15_00"); //How to I get to the upper quarter?
	
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
	AI_Output (other, self, "DIA_CITYGUIDE_TEMPEL_15_00"); //I'm looking for the temple.
	
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
	AI_Output (other, self, "DIA_CITYGUIDE_MARKT_15_00"); //Where's the marketplace?
	
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
	AI_Output (other, self, "DIA_CITYGUIDE_GALGEN_15_00"); //How do I get to the gallows square?
	
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
	AI_Output (other, self, "DIA_CITYGUIDE_KASERNE_15_00"); //Where's the barracks?
	
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
	AI_Output (other, self, "DIA_CITYGUIDE_HAFEN_15_00"); //Where's the harbor district?
	
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

	
	


