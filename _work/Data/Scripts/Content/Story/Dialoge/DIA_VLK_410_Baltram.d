///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Baltram_EXIT   (C_INFO)
{
	npc         = VLK_410_Baltram;
	nr          = 999;
	condition   = DIA_Baltram_EXIT_Condition;
	information = DIA_Baltram_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Baltram_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Baltram_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////AUSKOMMENTIERT WEGEN ADDON M.F. (Missionen passen nicht mehr, Spielfluß hemmend)
//	Info Sperre
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Baltram_Sperre		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	1;
	condition	 = 	DIA_Baltram_Sperre_Condition;
	information	 = 	DIA_Baltram_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Baltram_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self, ZS_Talk ))
	&& ((!Npc_KnowsInfo (other, DIA_Addon_Baltram_LaresAbloese))
	|| (SCIsWearingRangerRing == FALSE))
	{
		return TRUE;
	};
};
func void DIA_Baltram_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Baltram_Sperre_01_00"); //Was willst du? Du bist ein Sträfling aus der Minenkolonie. Mit dir mache ich keine Geschäfte!
	AI_StopProcessInfos (self);	 
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Hallo		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	2;
	condition	 = 	DIA_Baltram_Hallo_Condition;
	information	 = 	DIA_Baltram_Hallo_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Baltram_Hallo_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	//&& (Canthar_Sperre == FALSE)
	&& (MIS_Nagur_Bote == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Baltram_Hallo_Info ()
{
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Baltram_Hallo_01_00"); //Willkommen Fremder, mein Name ist Baltram. Bist du gekommen, um dich mit Nahrung einzudecken?
		AI_Output (self, other, "DIA_Baltram_Hallo_01_01"); //Da muss ich dich leider enttäuschen. Ich habe momentan nicht viel auf Lager.
		AI_Output (self, other, "DIA_Baltram_Hallo_01_02"); //Aber bald bekomme ich eine weitere Lieferung.
	}
	else
	{
		AI_Output (self, other, "DIA_Baltram_Hallo_01_03"); //Wenn du gekommen bist, um Nahrungsmittel bei mir zu kaufen, kannst du gleich wieder verschwinden.
		AI_Output (self, other, "DIA_Baltram_Hallo_01_04"); //Ich halte nicht viel von euch Söldnern! Ihr macht mir nur Ärger.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LaresAbloese
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_LaresAbloese		(C_INFO)
{
	npc		 	= VLK_410_Baltram;
	nr		 	= 1;
	condition	= DIA_Addon_Baltram_LaresAbloese_Condition;
	information	= DIA_Addon_Baltram_LaresAbloese_Info;

	important 	= TRUE;
};

func int DIA_Addon_Baltram_LaresAbloese_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (SCIsWearingRangerRing == TRUE)
	&& (MIS_Lares_BringRangerToMe == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_LaresAbloese_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_00"); //Warum schaust du so skeptisch?
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_01"); //Ich sehe, du trägst das Zeichen des 'Rings des Wassers'.
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_02"); //Du gehörst auch dazu?
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_03"); //Und wenn es so wäre?
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_04"); //Dann würde ich dir sagen, dass Lares auf seinem Posten am Hafen abgelöst werden will.
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_05"); //Gut. In dem Fall, würde ich mich darum kümmern, dass sich jemand darum kümmert.
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_06"); //Verstehe.
	B_GivePlayerXP (XP_Ambient);

	B_LogEntry (TOPIC_Addon_BringRangerToLares,"Baltram der Händler am Marktplatz wird sich um eine Ablösung für Lares kümmern. Vielleicht kann Lares JETZT vom Hafen weg."); 

	SC_KnowsBaltramAsRanger = TRUE;
	Baltram_Exchange4Lares = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Job
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Job		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	3;
	condition	 = 	DIA_Baltram_Job_Condition;
	information	 = 	DIA_Baltram_Job_Info;
	permanent	 =  FALSE;
	description  =  "Hast du einen Job für mich?";
};
func int DIA_Baltram_Job_Condition ()
{
	if (MIS_Nagur_Bote != LOG_RUNNING)
	&& (MIS_Nagur_Bote != LOG_SUCCESS)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Baltram_Job_Info ()
{
	AI_Output (other, self, "DIA_Baltram_Job_15_00"); //Hast du einen Job für mich?
	AI_Output (self, other, "DIA_Baltram_Job_01_01"); //Nein, ich habe schon einen Boten. Probier's doch mal bei den anderen Händlern.
};
///////////////////////////////////////////////////////////////////////
//	Info Trick
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Trick		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	4;
	condition	 = 	DIA_Baltram_Trick_Condition;
	information	 = 	DIA_Baltram_Trick_Info;
	permanent	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Baltram_Trick_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_Nagur_Bote == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Baltram_Trick_Info ()
{
	AI_Output (self, other, "DIA_Baltram_Trick_01_00"); //Hast du Interesse an einem Job?
	AI_Output (other, self, "DIA_Baltram_Trick_15_01"); //Klar, worum geht's?
	AI_Output (self, other, "DIA_Baltram_Trick_01_02"); //Mein Bote ist nicht zurückgekehrt, und ich warte auf eine Lieferung vom Bauer Akil.
	AI_Output (other, self, "DIA_Baltram_Trick_15_03"); //Und wie viel ist dir die Sache wert?
	AI_Output (self, other, "DIA_Baltram_Trick_01_04"); //Ich gebe dir 50 Goldstücke.
	AI_Output (other, self, "DIA_Baltram_Trick_15_05"); //Gut, ich bin dabei.
	AI_Output (self, other, "DIA_Baltram_Trick_01_06"); //Okay, sag Akil einfach, dass du von mir kommst, er wird dir dann ein Paket geben. Das bringst du zu mir.
	
	MIS_Baltram_ScoutAkil = LOG_RUNNING;
	B_LogEntry (TOPIC_Nagur,"Baltram hat mich als Bote eingestellt. Jetzt muss ich die Lieferung von Akils Hof abholen.");
	
	Log_CreateTopic (TOPIC_Baltram,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Baltram,LOG_RUNNING);
	B_LogEntry (TOPIC_Baltram, "Wenn ich Baltram seine Lieferung bringe, zahlt er mir 50 Goldstücke.");
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
var int Baltram_TradeLOG;
// --------------------------------------------------------------
instance DIA_Baltram_WAREZ		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	2;
	condition	 = 	DIA_Baltram_WAREZ_Condition;
	information	 = 	DIA_Baltram_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Zeig mir deine Ware";
};

func int DIA_Baltram_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Baltram_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self,"DIA_Baltram_WAREZ_15_00"); //Zeig mir deine Ware.
	
	if (Baltram_TradeLOG == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Baltram handelt mit Nahrungsmitteln am Marktplatz.");
		Baltram_TradeLOG = TRUE;
	};
	
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_01"); //Man hätte es gar nicht so weit kommen lassen sollen. Jetzt hat doch einer der Söldner tatsächlich einen der Paladine ermordet.
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_02"); //Irgendwann musste ja etwas passieren!
	};
	if ((MIS_BaltramTrade != LOG_SUCCESS)
	&& ((hero.guild == GIL_SLD)
	||  (hero.guild == GIL_DJG)))
	{
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_03"); //Typen wie du kriegen bei mir nichts.
		AI_Output (other, self,"DIA_Baltram_WAREZ_15_04"); //Wieso?
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_05"); //Erst die Bauern aufwiegeln und dann so tun, als wäre nichts gewesen.
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_06"); //Jetzt verschwinde, du vertreibst mir die Kundschaft.
		
		MIS_BaltramTrade = LOG_FAILED;
		
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Skip
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_Skip		(C_INFO)
{
	npc		 = 	VLK_410_Baltram;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Baltram_Skip_Condition;
	information	 = 	DIA_Addon_Baltram_Skip_Info;

	description	 = 	"Du handelst mit Piraten?";
};

func int DIA_Addon_Baltram_Skip_Condition ()
{
	if (SCKnowsBaltramAsPirateTrader == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Baltram_Skip_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_Skip_15_00"); //(beiläufig) Du handelst mit Piraten?
	AI_Output	(self, other, "DIA_Addon_Baltram_Skip_01_01"); //(fühlt sich erwischt) Was? Wer hat dir das erzählt?
	AI_Output	(other, self, "DIA_Addon_Baltram_Skip_15_02"); //Ich hab mich mit einem von ihnen unterhalten. Er scheint in seiner Bucht auf dich zu warten.
	AI_Output	(self, other, "DIA_Addon_Baltram_Skip_01_03"); //Was willst du machen? Es sind harte Zeiten. Jeder muss sehen, wo er bleibt.
	
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Hattest du keine Angst erwischt zu werden?", DIA_Addon_Baltram_Skip_erwischen );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Das wird Konsequenzen für dich haben!", DIA_Addon_Baltram_Skip_MIL );
};
func void DIA_Addon_Baltram_Skip_Back ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_Back_15_00"); //Das war alles, was ich wissen wollte.
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
};

func void DIA_Addon_Baltram_Skip_MIL ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_MIL_15_00"); //Das wird Konsequenzen für dich haben!
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_MIL_01_01"); //Hey, hör zu. Ich sag dir alles, was ich weiß, und du verpfeifst mich dafür nicht, okay?
	
	Info_ClearChoices (DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Womit handelt ihr?", DIA_Addon_Baltram_Skip_was );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Was weißt du über die Piraten?", DIA_Addon_Baltram_Skip_pirat );
};

func void DIA_Addon_Baltram_Skip_erwischen ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_erwischen_15_00"); //Hattest du keine Angst erwischt zu werden?
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_erwischen_01_01"); //Das kann passieren. Du hast es ja auch herausgefunden.
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_erwischen_01_02"); //Aber du hältst doch dicht, oder?
	
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Womit handelt ihr?", DIA_Addon_Baltram_Skip_was );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Was weißt du über die Piraten?", DIA_Addon_Baltram_Skip_pirat );
};

func void DIA_Addon_Baltram_Skip_was ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_was_15_00"); //(barsch) Womit handelt ihr?
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_was_01_01"); //Ich versorge sie meistens mit Nahrung.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_was_01_02"); //Und von ihnen erhalte ich dafür den besten Rum, den man in Khorinis kriegen kann.
	
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Das war alles, was ich wissen wollte.", DIA_Addon_Baltram_Skip_Back );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Ich könnte den Handel für dich abwickeln.", DIA_Addon_Baltram_Skip_Ich );
};

func void DIA_Addon_Baltram_Skip_Ich ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_Ich_15_00"); //(grinst) Ich könnte den Handel für dich abwickeln.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_01"); //Das wäre gut. Ich kann Khorinis zur Zeit nicht verlassen.
	CreateInvItems (self, ItMi_Packet_Baltram4Skip_Addon, 1);									
	B_GiveInvItems (self, other, ItMi_Packet_Baltram4Skip_Addon, 1);		
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_02"); //Hier, nimm dieses Päckchen und sag Skip, dass er mit dem Rum diesmal nicht so knausern soll.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_03"); //3 Flaschen sollten es schon sein.
	
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Baltram gab mir ein Paket. Ich soll es Skip überbringen."); 
	
	MIS_Addon_Baltram_Paket4Skip = LOG_RUNNING;
};

func void DIA_Addon_Baltram_Skip_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_pirat_15_00"); //(barsch) Was weißt du über die Piraten?
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_01"); //(hastig) Sie leben in einem abgelegenen Teil der Insel Khorinis.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_02"); //Soviel ich weiß, kann man den nur mit einer Kogge oder einem Schiff erreichen.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_03"); //Die Bürger von Khorinis fürchten sich vor ihnen. Auch zurecht, weil sie im Grunde ein Haufen übler Halsabschneider sind.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_04"); //Aber, wenn du mich fragst, sind sie bei weitem nicht so schlimm wie die Banditen.
};

///////////////////////////////////////////////////////////////////////
//	Info SkipsRum
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_SkipsRum		(C_INFO)
{
	npc		 = 	VLK_410_Baltram;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Baltram_SkipsRum_Condition;
	information	 = 	DIA_Addon_Baltram_SkipsRum_Info;

	description	 = 	"Ich habe den Rum von Skip.";
};

func int DIA_Addon_Baltram_SkipsRum_Condition ()
{
	
	if (Skip_Rum4Baltram == TRUE)
	&& (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems (other,ItFo_Addon_Rum) >= 2)
		{
			return TRUE;
		};
};

func void DIA_Addon_Baltram_SkipsRum_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_SkipsRum_15_00"); //Ich habe den Rum von Skip. Er hat mir allerdings nur 2 Flaschen gegeben.
	AI_Output	(self, other, "DIA_Addon_Baltram_SkipsRum_01_01"); //(sauer) Verdammt teuer. Was bildet sich dieser Kerl ein. Ach, gib schon her.
	B_GiveInvItems (other, self, ItFo_Addon_Rum,2); 
	AI_Output	(self, other, "DIA_Addon_Baltram_SkipsRum_01_02"); //Viel kann ich dir dafür jetzt nicht geben. Das hier muss dir reichen.
	CreateInvItems (self, ItMi_Gold, 10);									
	B_GiveInvItems (self, other, ItMi_Gold, 10);		

	TOPIC_END_BaltramSkipTrade = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_AkilsHof		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  4;
	condition	 = 	DIA_Baltram_AkilsHof_Condition;
	information	 = 	DIA_Baltram_AkilsHof_Info;
	permanent	 =  FALSE;
	description	 = 	"Wo finde ich Akils Hof?";
};
func int DIA_Baltram_AkilsHof_Condition ()
{
	if (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Baltram_AkilsHof_Info ()
{
	AI_Output (other, self, "DIA_Baltram_AkilsHof_15_00"); //Wo finde ich Akils Hof?
	AI_Output (self, other, "DIA_Baltram_AkilsHof_01_01"); //Geh einfach hier vorne durch das Osttor raus und folge dem Weg nach Südosten.
	AI_Output (self, other, "DIA_Baltram_AkilsHof_01_02"); //Nach kurzer Zeit kommst du an eine Steintreppe. Die gehst du rauf und von da kannst du Akils Hof schon sehen.
};
///////////////////////////////////////////////////////////////////////
//	Info Lieferung geholt
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Lieferung	(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  5;
	condition	 = 	DIA_Baltram_Lieferung_Condition;
	information	 = 	DIA_Baltram_Lieferung_Info;
	permanent 	 =  FALSE;
	description	 = 	"Ich habe die Lieferung von Akil.";
};

func int DIA_Baltram_Lieferung_Condition ()
{
	if (Npc_HasItems (other, ItMi_BaltramPaket) >=1)
	{
		return TRUE;
	};
};
func void DIA_Baltram_Lieferung_Info ()
{
	AI_Output (other, self, "DIA_Baltram_Lieferung_15_00"); //Ich habe die Lieferung von Akil.
	AI_Output (self, other, "DIA_Baltram_Lieferung_01_01"); //Ausgezeichnet. Endlich kann ich wieder frische Waren anbieten. Hier sind deine 50 Goldstücke.
	
	B_GiveInvItems (other, self, ItMi_BaltramPaket,1);
	B_GiveInvItems (self, other, ItMi_Gold,50);
	
	MIS_Baltram_ScoutAkil = LOG_SUCCESS;
	MIS_Nagur_Bote = LOG_FAILED;
	B_GivePlayerXP (XP_Baltram_ScoutAkil);
	
	Npc_RemoveInvItems (self, ItMi_BaltramPaket,1);
	
	CreateInvItems (self,ItFo_Cheese	,  5); 	
	CreateInvItems (self,ItFo_Apple 	, 10); 
	CreateInvItems (self,ItFo_Beer  	,  5);
	CreateInvItems (self,ItFo_Bacon 	,  5);
	CreateInvItems (self,ItFo_Sausage	,  5);
	
};

///////////////////////////////////////////////////////////////////////
//	Info LetUsTrade
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_LetUsTrade		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  6;
	condition	 = 	DIA_Baltram_LetUsTrade_Condition;
	information	 = 	DIA_Baltram_LetUsTrade_Info;
	permanent	 =  FALSE;
	description	 = 	"Können wir nicht doch ins Geschäft kommen?";
};
func int DIA_Baltram_LetUsTrade_Condition ()
{
	if (MIS_BaltramTrade == LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Baltram_LetUsTrade_Info ()
{
	AI_Output (other, self, "DIA_Baltram_LetUsTrade_15_00"); //Können wir nicht doch ins Geschäft kommen?
	AI_Output (self, other, "DIA_Baltram_LetUsTrade_01_01"); //Pass auf, wenn du mir 10 Schinken und 10 Flaschen Wein besorgst, dann werde ich wieder mir dir handeln.
	AI_Output (other, self, "DIA_Baltram_LetUsTrade_15_02"); //Ich werde sehen, was ich tun kann.
	
	MIS_BaltramTrade = LOG_RUNNING;
};

var int BaltramEnoughBacon;
var int BaltramEnoughWine;

///////////////////////////////////////////////////////////////////////
//	Info HaveYourWarez
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_HaveYourWarez		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  6;
	condition	 = 	DIA_Baltram_HaveYourWarez_Condition;
	information	 = 	DIA_Baltram_HaveYourWarez_Info;
	permanent	 =  TRUE;
	description	 = 	"Ich habe deine Ware.";
};
func int DIA_Baltram_HaveYourWarez_Condition ()
{
	if (MIS_BaltramTrade == LOG_RUNNING)
	&& (MIS_BaltramTrade != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Baltram_HaveYourWarez_Info ()
{
	AI_Output (other, self, "DIA_Baltram_HaveYourWarez_15_00"); //Ich habe deine Ware.
	AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_01"); //Zeig her.
	
	if (Npc_HasItems (other,ItFo_Bacon) < 10)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_02"); //Wir hatten doch 10 Schinken ausgemacht. Komm wieder, wenn du genug zusammen hast.
		
		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};  
	if (Npc_HasItems (other,ItFo_Wine) < 10)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_03"); //Und was ist mit den 10 Flaschen Wein? Hast du die etwa vergessen?
	
		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};
	
	if (BaltramEnoughBacon == TRUE
	&&  BaltramEnoughWine  == TRUE)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_04"); //Hmm, ist zwar nicht die beste Qualität, aber in diesen Zeiten sollte man nicht zu wählerisch sein.
		
		B_GiveInvItems (other,self,ItFo_Bacon,10);
		B_GiveInvItems (other,self,ItFo_Wine,10);
		
		MIS_BaltramTrade = LOG_SUCCESS;
	
		B_GivePlayerXP (XP_BaltramTrade);
		
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_05"); //Jetzt sollte unseren zukünftigen Geschäften nichts mehr im Wege stehen.
	};	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Baltram_PICKPOCKET (C_INFO)
{
	npc			= VLK_410_Baltram;
	nr			= 900;
	condition	= DIA_Baltram_PICKPOCKET_Condition;
	information	= DIA_Baltram_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Baltram_PICKPOCKET_Condition()
{
	C_Beklauen (76, 175);
};
 
FUNC VOID DIA_Baltram_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Baltram_PICKPOCKET);
	Info_AddChoice		(DIA_Baltram_PICKPOCKET, DIALOG_BACK 		,DIA_Baltram_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Baltram_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Baltram_PICKPOCKET_DoIt);
};

func void DIA_Baltram_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Baltram_PICKPOCKET);
};
	
func void DIA_Baltram_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Baltram_PICKPOCKET);
};



















