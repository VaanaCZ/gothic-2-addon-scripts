// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gerold_EXIT(C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 999;
	condition	= DIA_Gerold_EXIT_Condition;
	information	= DIA_Gerold_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Gerold_EXIT_Condition()
{
	if (Kapitel < 4)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Gerold_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 	Wer sitzt im Kerker?
// ************************************************************
INSTANCE DIA_Gerold_Hallo (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Hallo_Condition;
	information	= DIA_Gerold_Hallo_Info;
	permanent	= FALSE;
	description = "Was bewachst du?";
};                       
FUNC INT DIA_Gerold_Hallo_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_Hallo_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Hallo_15_00");//Was bewachst du?
	AI_Output	(self ,other,"DIA_Gerold_Hallo_12_01");//Die Gefangenen.
	AI_Output	(other,self ,"DIA_Gerold_Hallo_15_02");//Und wer ist das?
	AI_Output	(self ,other,"DIA_Gerold_Hallo_12_03");//Ein paar Sträflinge und den Söldner Gorn. Ein harter Bursche - stark wie ein Ochse.
	AI_Output	(self ,other,"DIA_Gerold_Hallo_12_04");//Es waren vier Mann nötig, um ihn in Gewahrsam zu nehmen.
};	
// ************************************************************
// 	Kerker
// ************************************************************
INSTANCE DIA_Gerold_Jail (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Jail_Condition;
	information	= DIA_Gerold_Jail_Info;
	permanent	= FALSE;
	description ="Kannst du mich in den Kerker lassen? ";
};                       
FUNC INT DIA_Gerold_Jail_Condition()
{
	if (Kapitel == 2)
	&& Npc_KnowsInfo (other, DIA_Gerold_Hallo)
	&&   (Garond_Kerkerauf == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_Jail_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Jail_15_00");//Kannst du mich in den Kerker lassen?
	AI_Output	(self ,other,"DIA_Gerold_Jail_12_01");//Nein. Der Kerker ist für NIEMANDEN zugänglich. Das gilt für JEDEN. Für dich, für Milten und jeden anderen.
	AI_Output	(self ,other,"DIA_Gerold_Jail_12_02");//Das hier ist keine Taverne, wo man rein und rausspazieren kann, wie man will. Merk dir das.
	
	KnowsAboutGorn = TRUE;  
};	
// ************************************************************
// 	Ausnahme
// ************************************************************
INSTANCE DIA_Gerold_Ausnahme (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Ausnahme_Condition;
	information	= DIA_Gerold_Ausnahme_Info;
	permanent	= FALSE;
	description ="Kannst du nicht mal eine Ausnahme machen?";
};                       
FUNC INT DIA_Gerold_Ausnahme_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Gerold_Jail))
	&& (Kapitel == 2)
	&&   (Garond_Kerkerauf == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_Ausnahme_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Ausnahme_15_00");//Kannst du nicht mal eine Ausnahme machen?
	AI_Output	(self ,other,"DIA_Gerold_Ausnahme_12_01");//Nein.
};	
// ************************************************************
// 	Gold
// ************************************************************
INSTANCE DIA_Gerold_Gold (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Gold_Condition;
	information	= DIA_Gerold_Gold_Info;
	permanent	= FALSE;
	description ="Und wenn ich dir Gold zahle?";
};                       
FUNC INT DIA_Gerold_Gold_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Gerold_Ausnahme))
	&& (Kapitel == 2)
	&&   (Garond_Kerkerauf == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_Gold_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Gold_15_00");//Und wenn ich dir Gold zahle?
	AI_Output	(self ,other,"DIA_Gerold_Gold_12_01");//... hm ...
	AI_Output	(self ,other,"DIA_Gerold_Gold_12_02");//Nein.
};		
// ************************************************************
// 	Deal mit Gerold um Brief reinzuschmuggeln
// ************************************************************
INSTANCE DIA_Gerold_Deal (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Deal_Condition;
	information	= DIA_Gerold_Deal_Info;
	permanent	= FALSE;
	description ="Ich habe hier eine Notiz für einen Gefangenen...";
};                       

FUNC INT DIA_Gerold_Deal_Condition()
{
	
	IF 	 (MIS_RescueGorn == LOG_RUNNING)
	&&	 (Npc_HasItems (other,ItWr_LetterForGorn_MIS) >=1)
	&& 	 (Kapitel == 2)
	&&   (Garond_Kerkerauf == FALSE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Gerold_Deal_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Deal_15_00");	//Ich habe hier eine Notiz für einen Gefangenen. Kannst du sie weitergeben?
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_01");	//Hm ... prinzipiell spricht nichts dagegen. Für wen ist denn diese Notiz?
	AI_Output	(other,self ,"DIA_Gerold_Deal_15_02");	//Für Gorn.
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_03");	//Ein sehr wichtiger Gefangener. Ich glaube, Garond wäre nicht damit einverstanden. Aber wenn dir das wichtig ist, werden wir uns bestimmt einigen.
	AI_Output	(other,self ,"DIA_Gerold_Deal_15_04");	//Was willst du?
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_05");	//Unsere Nahrungsrationen werden ständig gekürzt. Ich will mal wieder was Anständiges essen.
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_06");	//Besorg mir eine leckere Wurst und einen frischen Laib Brot - und süßen Honig.
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_07");	//Dazu eine Flasche Wein ... Ja, das sollte reichen. Das wirst du ja wohl hinkriegen. Also komm wieder, wenn du das Zeug hast.
	
	B_LogEntry (TOPIC_RescueGorn,"Wenn ich Gerold eine Wurst, Brot, Wein und Honig bringe, wird er die Nachricht an Gorn weiterleiten.");
};	
// ************************************************************
// 	Deal Stuff
// ************************************************************		  				   
INSTANCE DIA_Gerold_Stuff (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Stuff_Condition;
	information	= DIA_Gerold_Stuff_Info;
	permanent	= TRUE;
	description = "Ich hab hier was für dich...";
};
//-----------------------------------                       
var int DIA_Gerold_Stuff_permanent;
//-----------------------------------
FUNC INT DIA_Gerold_Stuff_Condition()
{
	IF (Npc_HasItems (other,ItWr_LetterForGorn_MIS) >=1 )
	&&	Npc_KnowsInfo (other,DIA_Gerold_Deal)
	&& (Kapitel == 2)
	&& (DIA_Gerold_Stuff_permanent == FALSE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Gerold_Stuff_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Stuff_15_00");	//Ich hab hier was für dich. Das Essen, das du haben wolltest.
	
	
	//------------------HACK für deutliche Anzeige-------------------
	
	if (Npc_HasItems (other, ItFo_Honey) >= 1)
	&& (Npc_HasItems (other, ItFo_Bread) >= 1)
	&& (Npc_HasItems (other, ItFo_Wine) >= 1)
	&& (Npc_HasItems (other, ItFo_Sausage) >= 1)
	{
		 AI_PrintScreen ("Honig gegeben",	 -1, 34, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Brot gegeben",	 -1, 37, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Wein gegeben",     -1, 40, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Wurst gegeben",  	 -1, 43, FONT_ScreenSmall, 2);
			
		Npc_RemoveInvItems (other, ItFo_Honey,1);
		Npc_RemoveInvItems (other, ItFo_Bread,1);
		Npc_RemoveInvItems (other, ItFo_Wine,1);
		Npc_RemoveInvItems (other, ItFo_Sausage,1);	
	/*
	if (B_GiveInvItems (other,self,ItFo_Honey  ,1)
	&&  B_GiveInvItems (other,self,ItFo_Bread  ,1)
	&&  B_GiveInvItems (other,self,ItFo_Wine   ,1)
	&&  B_GiveInvItems (other,self,ItFo_Sausage,1))
	{
	*/
	
		AI_Output	(self ,other,"DIA_Gerold_Stuff_12_01");	//Gut, gib her das Zeug. Hast du die Nachricht?
		AI_Output   (other,self ,"DIA_Gerold_Stuff_15_02"); //Ja, hier. Denk daran, sie ist für Gorn.
		AI_Output 	(self ,other,"DIA_Gerold_Stuff_12_03"); //Komm morgen wieder, dann hat er die Nachricht bekommen.
		
		B_GiveInvItems (other,self ,ItWr_LetterForGorn_MIS,1); 
		DayContactGorn = Wld_GetDay();
		DIA_Gerold_Stuff_permanent = TRUE;
		
		B_LogEntry (TOPIC_RescueGorn,"Gerold hat bekommen was er wollte und wird sich um die Nachricht kümmern.");
	}
	else 
	{
		AI_Output (self ,other,"DIA_Gerold_Stuff_12_04"); //Komm wieder, wenn du das Zeug dabei hast, was ich wollte.
	};
};
// ************************************************************
// 	Deal Antwort
// ************************************************************		  	
INSTANCE DIA_Gerold_Antwort (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Antwort_Condition;
	information	= DIA_Gerold_Antwort_Info;
	permanent	= TRUE;
	description = "Hat Gorn die Nachricht bekommen?";
};                       
//-------------------------------------
var int DIA_Gerold_Antwort_permanent; 
//-------------------------------------
FUNC INT DIA_Gerold_Antwort_Condition()
{	
	if (DIA_Gerold_Stuff_permanent == TRUE)
	&& (Kapitel == 2)
	&& (DIA_Gerold_Antwort_permanent == FALSE)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Gerold_Antwort_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Antwort_15_00");//Hat Gorn die Nachricht bekommen?
	
	if (DayContactGorn < Wld_GetDay() )
	{
		AI_Output	(self ,other,"DIA_Gerold_Antwort_12_01");//Ja, ich soll dir was von ihm ausrichten:
		AI_Output	(other,self ,"DIA_Gerold_Antwort_15_02");//Und?
		AI_Output	(self ,other,"DIA_Gerold_Antwort_12_03");//Es liegt am Südtor.
		AI_Output	(other,self ,"DIA_Gerold_Antwort_15_04");//Hat er noch was gesagt?
		AI_Output	(self ,other,"DIA_Gerold_Antwort_12_05");//Nein. Keine Ahnung, was das bedeuten soll. Weißt du, was es bedeutet?
		AI_Output	(other,self ,"DIA_Gerold_Antwort_15_06");//Vielleicht. Aber du solltest nicht weiter darüber nachdenken.
		AI_Output	(self ,other,"DIA_Gerold_Antwort_12_07");//Ist wahrscheinlich besser.
		
		
		GornsTreasure = TRUE;	
		DIA_Gerold_Antwort_permanent = TRUE;
		B_LogEntry (TOPIC_RescueGorn,"Gorn läßt uns ausrichten, das sein Gold am Südtor liegt.");
	}
	else
	{
		AI_Output	(self ,other,"DIA_Gerold_GornsAnswer_12_08");//Nein, noch nicht. Komm später wieder.
	};
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 	Offizielle Freilassung
// ************************************************************		  	
INSTANCE DIA_Gerold_SetGornFree (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_SetGornFree_Condition;
	information	= DIA_Gerold_SetGornFree_Info;
	permanent	= FALSE;
	description = "Lass Gorn frei.";
};                       

FUNC INT DIA_Gerold_SetGornFree_Condition()
{	
	if (Garond_Kerkerauf == TRUE)
	&& (Kapitel == 2)	
	{
		return TRUE;	
	};
};
 
FUNC VOID DIA_Gerold_SetGornFree_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_SetGornFree_15_00");//Lass Gorn frei. Ich komme auf Befehl vom Kommandanten Garond.
	AI_Output	(self ,other,"DIA_Gerold_SetGornFree_12_01");//Ich bin schon informiert worden. Hier ist der Schlüssel, du kannst reingehen.

	CreateInvItems (self, ItKe_PrisonKey_MIS,1);
	B_GiveInvItems	(self,other,ItKe_PrisonKey_MIS,1);
	B_LogEntry (TOPIC_RescueGorn,"Gerold hat mir den Schlüssel für den Knast gegeben.");
};
// ************************************************************
// 	Perm
// ************************************************************
INSTANCE DIA_Gerold_Perm (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 900;
	condition	= DIA_Gerold_Perm_Condition;
	information	= DIA_Gerold_Perm_Info;
	permanent	= TRUE;
	description = "Schläfst du eigentlich nie?";
};                       
FUNC INT DIA_Gerold_Perm_Condition()
{
	if (Kapitel < 4)
	&& Npc_KnowsInfo (other,DIA_Gerold_Gold)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_Perm_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Perm_15_00");//Schläfst du eigentlich nie?
	AI_Output	(self ,other,"DIA_Gerold_Perm_12_01");//Nein. Innos selbst verleiht mir die Kraft, niemals schlafen zu müssen.
};	
//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Gerold_KAP4_EXIT(C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 999;
	condition	= DIA_Gerold_KAP4_EXIT_Condition;
	information	= DIA_Gerold_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gerold_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



///////////////////////////////////////////////////////////////////////
//	Info AllesRuhig
///////////////////////////////////////////////////////////////////////
instance DIA_Gerold_KAP4_ALLESRUHIG		(C_INFO)
{
	npc		 = 	PAL_261_Gerold;
	nr		 = 	30;
	condition	 = 	DIA_Gerold_KAP4_ALLESRUHIG_Condition;
	information	 = 	DIA_Gerold_KAP4_ALLESRUHIG_Info;

	description	 = 	"Alles ruhig?";
};

func int DIA_Gerold_KAP4_ALLESRUHIG_Condition ()
{
	if (Kapitel >= 4)	
	{
		return TRUE;
	};
};

func void DIA_Gerold_KAP4_ALLESRUHIG_Info ()
{
	AI_Output			(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_15_00"); //Alles ruhig?
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_12_01"); //Ruhig schon.
	AI_Output			(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_15_02"); //Aber?
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_12_03"); //Mir hängt der Magen in den Kniekehlen, Mann. Garond hat schon wieder die Nahrungsrationen gekürzt.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_12_04"); //Wenn ich nicht bald was Anständiges zwischen die Zähne bekomme, dann beiße ich Garond in seinen fetten Arsch.

	Info_ClearChoices	(DIA_Gerold_KAP4_ALLESRUHIG);
	Info_AddChoice	(DIA_Gerold_KAP4_ALLESRUHIG, "Nicht mein Problem.", DIA_Gerold_KAP4_ALLESRUHIG_Nein );
	Info_AddChoice	(DIA_Gerold_KAP4_ALLESRUHIG, "Vielleicht kann ich dir etwas geben.", DIA_Gerold_KAP4_ALLESRUHIG_geben );
};
func void DIA_Gerold_KAP4_ALLESRUHIG_geben ()
{
	AI_Output			(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_geben_15_00"); //Vielleicht kann ich dir etwas geben.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_01"); //Bist du verrückt. Doch nicht hier. Wenn das einer der anderen sieht, hab ich gleich 'ne Menge neuer Freunde, wenn du verstehst, was ich meine.
	if 	(Wld_IsTime	(23,10,08,00) == FALSE)
	{
		AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_02"); //Du findest mich im Magiertempel, wenn sich alle zurück gezogen haben.
	}
	else
	{
		AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_03"); //Schnell, folge mir in den Magiertempel, bevor die anderen wieder aus ihren Löchern kommen. Ich hab keine Lust, bis morgen zu warten.
	};
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_04"); //Im Tempel ist sowieso zurzeit kaum jemand. Ich werde dort auf dich warten.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_05"); //Komm mir aber bloß nicht mit einem trockenem Brot oder irgendeinem rohen Fleischdreck, klar?

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Food"); 

 	Log_CreateTopic (TOPIC_GeroldGiveFood, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GeroldGiveFood, LOG_RUNNING);
	B_LogEntry (TOPIC_GeroldGiveFood,"Garond hat schon wieder die Nahrungsrationen gekürzt. Bevor Gerold vor Hunger etwas dummes anstellt, werde ich ihm besser was zu essen geben. Ich soll ihn im Magierhaus der Burg treffen, wenn alle anderen schlafen."); 

	MIS_GeroldGiveFood = LOG_RUNNING;
};

func void DIA_Gerold_KAP4_ALLESRUHIG_Nein ()
{
	AI_Output			(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_Nein_15_00"); //Nicht mein Problem.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_01"); //Du hast gut reden. Dir kürzt Garond sicher nicht die Rationen.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_02"); //Auch wenn er es nicht zugibt, aber sein Arsch geht ihm ganz schön auf Grundeis und er sieht in dir seine einzige Rettung.

	AI_StopProcessInfos (self);
};

var int Gerold_FoodCounter;
///////////////////////////////////////////////////////////////////////
//	Info Food
///////////////////////////////////////////////////////////////////////
instance DIA_Gerold_FOOD		(C_INFO)
{
	npc		 = 	PAL_261_Gerold;
	nr		 = 	31;
	condition	 = 	DIA_Gerold_FOOD_Condition;
	information	 = 	DIA_Gerold_FOOD_Info;
	important	 = 	TRUE;
};

func int DIA_Gerold_FOOD_Condition ()
{
	if (Npc_GetDistToWP(self,"OC_MAGE_IN")<500) 
		&& (Kapitel >= 4)
		{
				return TRUE;
		};
};

func void DIA_Gerold_MoreFood ()
{
	Info_ClearChoices	(DIA_Gerold_FOOD);

	if (Gerold_FoodCounter > 8)
	{
		AI_Output			(self, other, "DIA_Gerold_MoreFood_12_00"); //Das reicht. Das reicht. Damit komme ich erstmal über die Runden.
		AI_Output			(self, other, "DIA_Gerold_MoreFood_12_01"); //Hier hast du mein Gold. Hier draußen kann ich eh nichts dafür kaufen, also kannst du es auch genauso gut haben.
		AI_Output			(self, other, "DIA_Gerold_MoreFood_12_02"); //Ich geh dann besser, bevor man uns sieht.
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"Start");
		MIS_GeroldGiveFood = LOG_SUCCESS;
		B_GivePlayerXP (XP_GeroldGiveFood);	
		CreateInvItems 		(self, ItMi_Gold, 450);									
		B_GiveInvItems 		(self, other, ItMi_Gold, 450);					
	}
	else
	{
		if (Gerold_FoodCounter == 0)
			{
				Info_AddChoice	(DIA_Gerold_FOOD, "Ich hab gerade nichts dabei.", DIA_Gerold_FOOD_nichts );
			}
		else
			{
				Info_AddChoice	(DIA_Gerold_FOOD, "Mehr hab´ ich nicht.", DIA_Gerold_FOOD_kaese_nichtmehr );
				if (Gerold_FoodCounter < 5)
				{
					AI_Output			(self, other, "DIA_Gerold_MoreFood_12_03"); //Klar. Her damit. Hast du noch mehr?
				}
				else
				{
					AI_Output			(self, other, "DIA_Gerold_MoreFood_12_04"); //Ja. Mehr, mehr!
				};
			};
			
		if Npc_HasItems (other,ItFo_FishSoup)
				|| Npc_HasItems (other,ItFo_Stew)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Suppe Geben)", DIA_Gerold_FOOD_Suppe );
			};
		if Npc_HasItems (other,ItFoMutton)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Fleisch geben)", DIA_Gerold_FOOD_fleisch );
			};
		if Npc_HasItems (other,ItFo_Bacon)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Schinken geben)", DIA_Gerold_FOOD_schinken );
			};
		if Npc_HasItems (other,ItFo_Cheese)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Käse geben)", DIA_Gerold_FOOD_kaese );
			};
		if Npc_HasItems (other,ItFo_Sausage)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Wurst geben)", DIA_Gerold_FOOD_Wurst );
			};
			Gerold_FoodCounter = (Gerold_FoodCounter +1);
	};
};

func void DIA_Gerold_FOOD_Info ()
{
	AI_Output			(self, other, "DIA_Gerold_FOOD_12_00"); //Da bist du ja. Also, was ist jetzt? Hast du was zu essen für mich?

	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_nichts ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_nichts_15_00"); //Ich hab gerade nichts dabei.
	AI_Output			(self, other, "DIA_Gerold_FOOD_nichts_12_01"); //Erst machst du einen solchen Aufstand und jetzt willst du mich verarschen?
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	Npc_ExchangeRoutine	(self,"Start"); 
	MIS_GeroldGiveFood = LOG_FAILED;
	B_GivePlayerXP (XP_Ambient);
};


func void DIA_Gerold_FOOD_kaese_nichtmehr ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_kaese_nichtmehr_15_00"); //Mehr hab ich nicht.
	AI_Output			(self, other, "DIA_Gerold_FOOD_kaese_nichtmehr_12_01"); //Und das soll ich dir glauben? Na gut, besser als nichts. Hier hast du ein bisschen Gold dafür.
	CreateInvItems 		(self, ItMi_Gold, 50);									
	B_GiveInvItems 		(self, other, ItMi_Gold, 50);					
	AI_Output			(self, other, "DIA_Gerold_FOOD_kaese_nichtmehr_12_02"); //So. Ich muss zurück auf meinen Posten.
	AI_StopProcessInfos (self);
	
	var int XP_GeroldGiveFoodLow;
	var int Teiler;
	
	if (Gerold_FoodCounter < 4)
		{
			Teiler = 3;
		}
	else
		{
			Teiler = 2;
		};
	
	XP_GeroldGiveFoodLow = (XP_GeroldGiveFood/Teiler);
	
	Npc_ExchangeRoutine	(self,"Start");
	MIS_GeroldGiveFood = LOG_OBSOLETE;
	B_GivePlayerXP (XP_GeroldGiveFoodLow);	
};

func void DIA_Gerold_FOOD_kaese ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_kaese_15_00"); //Wie wär's mir einem saftigen Stück Käse?
	B_GiveInvItems (other,self , ItFo_Cheese, 1);	
	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_Wurst ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_Wurst_15_00"); //Ein Stück Wurst?
	B_GiveInvItems (other,self , ItFo_Sausage, 1);	
	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_schinken ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_schinken_15_00"); //Ich kann dir diesen Schinken geben.
	B_GiveInvItems (other,self , ItFo_Bacon, 1);	
	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_fleisch ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_fleisch_15_00"); //Ein Stück Fleisch?
	B_GiveInvItems (other,self , ItFoMutton, 1);	
	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_Suppe ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_Suppe_15_00"); //Ich denke, eine gute Suppe könnte dir schmecken.

	if (B_GiveInvItems (other, self, ItFo_FishSoup,1))
		{
		}
		else
		{
			B_GiveInvItems (other,self , ItFo_Stew, 1);
		};
	DIA_Gerold_MoreFood ();
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Gerold_PERM4		(C_INFO)
{
	npc		 = 	PAL_261_Gerold;
	nr		 = 	41;
	condition	 = 	DIA_Gerold_PERM4_Condition;
	information	 = 	DIA_Gerold_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Immer noch Hunger?";
};

func int DIA_Gerold_PERM4_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Gerold_KAP4_ALLESRUHIG))
		{
				return TRUE;
		};
};

func void DIA_Gerold_PERM4_Info ()
{
	AI_Output			(other, self, "DIA_Gerold_PERM4_15_00"); //Immer noch Hunger?
	
	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Gerold_PERM4_12_01"); //Wenn die Orks noch mal angreifen, hilft mir auch kein voller Magen.
	}
	else if (MIS_GeroldGiveFood == LOG_SUCCESS)
	{
	AI_Output			(self, other, "DIA_Gerold_PERM4_12_02"); //Das soll wohl ein Witz sein. Ich bin gemästet. Danke noch mal.
	}
	else if (MIS_GeroldGiveFood == LOG_OBSOLETE)
	{
	AI_Output			(self, other, "DIA_Gerold_PERM4_12_03"); //Ja. Aber trotzdem danke für deine Hilfe.
	}
	else
	{
		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Gerold_PERM4_12_04"); //Es geht schon, Meister.
		}
		else
		{
			AI_Output			(self, other, "DIA_Gerold_PERM4_12_05"); //Hau schon ab!
		};
	};
	AI_StopProcessInfos (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Gerold_KAP5_EXIT(C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 999;
	condition	= DIA_Gerold_KAP5_EXIT_Condition;
	information	= DIA_Gerold_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gerold_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Gerold_KAP6_EXIT(C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 999;
	condition	= DIA_Gerold_KAP6_EXIT_Condition;
	information	= DIA_Gerold_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gerold_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gerold_PICKPOCKET (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 900;
	condition	= DIA_Gerold_PICKPOCKET_Condition;
	information	= DIA_Gerold_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Gerold_PICKPOCKET_Condition()
{
	C_Beklauen (71, 170);
};
 
FUNC VOID DIA_Gerold_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gerold_PICKPOCKET);
	Info_AddChoice		(DIA_Gerold_PICKPOCKET, DIALOG_BACK 		,DIA_Gerold_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gerold_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gerold_PICKPOCKET_DoIt);
};

func void DIA_Gerold_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gerold_PICKPOCKET);
};
	
func void DIA_Gerold_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gerold_PICKPOCKET);
};















































