// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Alwin_EXIT(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 999;
	condition	= DIA_Alwin_EXIT_Condition;
	information	= DIA_Alwin_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Alwin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Alwin_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Alwin_PICKPOCKET (C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 900;
	condition	= DIA_Alwin_PICKPOCKET_Condition;
	information	= DIA_Alwin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Alwin_PICKPOCKET_Condition()
{
	C_Beklauen (20, 10);
};
 
FUNC VOID DIA_Alwin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Alwin_PICKPOCKET);
	Info_AddChoice		(DIA_Alwin_PICKPOCKET, DIALOG_BACK 		,DIA_Alwin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Alwin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Alwin_PICKPOCKET_DoIt);
};

func void DIA_Alwin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Alwin_PICKPOCKET);
};
	
func void DIA_Alwin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Alwin_PICKPOCKET);
};
//***************************************************
//		Schafe
//***************************************************
INSTANCE DIA_Alwin_Sheep(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 3;
	condition	= DIA_Alwin_Sheep_Condition;
	information	= DIA_Alwin_Sheep_Info;
	permanent	= FALSE;
	description = "Sind das deine Schafe?";
};                       
FUNC INT DIA_Alwin_Sheep_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Alwin_Sheep_Info()
{	
	AI_Output (other, self,"DIA_Alwin_Sheep_15_00"); //Sind das deine Schafe?
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_01"); //Mir gehört nur das eine, das auf den Namen Lucy hört. (lacht) Das ist meine Frau - die Lucy.
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_02"); //Die Schafe gehören der Miliz. Alle Schafe, die sie von den Bauern einkassieren, bringen sie zu mir.
};
//***************************************************
//		Der irre Fellan
//***************************************************
INSTANCE DIA_Alwin_Fellan(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 2;
	condition	= DIA_Alwin_Fellan_Condition;
	information	= DIA_Alwin_Fellan_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Alwin_Fellan_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_Fellan_Info()
{	
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_00"); //Junge, das Gehämmer von diesem Irren macht mich total fertig!
	AI_Output (other, self,"DIA_Alwin_Fellan_15_01"); //Wen meinst du?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_02"); //Hörst du nicht das Hämmern? Wer hämmert denn den ganzen Tag im Hafenviertel?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_03"); //Ich meine den irren Fellan. Der hämmert jeden Tag an seiner Hütte herum.
};
//***************************************************
//		Der irre Fellan
//***************************************************
INSTANCE DIA_Alwin_FellanRunning (C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 2;
	condition	= DIA_Alwin_FellanRunning_Condition;
	information	= DIA_Alwin_FellanRunning_Info;
	permanent	= FALSE;
	description = "Ich könnte mich um Fellan kümmern ...";
};                       
FUNC INT DIA_Alwin_FellanRunning_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_FellanRunning_Info()
{	
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_00"); //Ich könnte mich um Fellan kümmern ...
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_01"); //Du willst mir helfen? Was hast du davon?
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_02"); //Sag du's mir.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_03"); //Ach so sieht's aus! Na gut - wenn du es schaffst, dass er mit dem Gehämmer aufhört, zahle ich dir 25 Goldstücke.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_04"); //Aber eins sag ich dir gleich - mit dem Kerl kannst du nicht reden. Der ist irre. Da helfen nur ein paar ordentliche Schläge!
	
	MIS_AttackFellan = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Alwin,LOG_RUNNING);
	B_LogEntry (TOPIC_Alwin,"Alwin will das ich Fellan dazu bringe, das er mit dem Hämemrn aufhört. Es wäre bestimmt nicht angebracht, ihn zu töten.");
		
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
	Info_AddChoice (DIA_Alwin_FellanRunning, "Ich werd sehen, was ich machen kann...", DIA_Alwin_FellanRunning_Ok);
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		Info_AddChoice (DIA_Alwin_FellanRunning, "Wenn ich ihn verprügele bekomme ich doch Ärger mit der Miliz...", DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Ok_15_00"); //Ich werd sehen, was ich machen kann ...
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_Ok_12_01"); //Du kannst es dir ja noch überlegen. Denk daran, ich zahle dir 25 Goldmünzen.
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Problems_15_00"); //Wenn ich ihn verprügele, bekomme ich doch Ärger mit der Miliz ...
	AI_Output (self ,other,"DIA_Alwin_Add_12_00"); //Hier im Hafenviertel kümmert sich keiner um Schlägereien...
	AI_Output (self ,other,"DIA_Alwin_Add_12_01"); //Nur wenn du hier was klaust, oder dich an den Schafen vergreifst, bekomst du Ärger.

	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_01"); //Der irre Fellan wird nicht zur Miliz rennen und dich anzeigen. Du könntest höchstens ein Problem bekommen, wenn seine Nachbarn was davon mitbekommen.
	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_02"); //Schlägereien sind hier nicht gerne gesehen, und je mehr Zeugen es gibt, desto schlimmer wird die Sache.
	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_03"); //Aber wenn du ihn dazu bringst, dass ER dich angreift, werden alle Leute, die den Kampf mitkriegen, auf deiner Seite sein.
};

//***************************************************
//		Fellan auf's Maul gehauen 
//***************************************************
INSTANCE DIA_Alwin_FellanSuccess(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 4;
	condition	= DIA_Alwin_FellanSuccess_Condition;
	information	= DIA_Alwin_FellanSuccess_Info;
	permanent	= FALSE;
	description	= "Fellan wird nicht mehr hämmern.";
};                       
FUNC INT DIA_Alwin_FellanSuccess_Condition()
{	
	if (MIS_AttackFellan == LOG_RUNNING)
	&& ((FellanGeschlagen == TRUE)
	|| Npc_IsDead (Fellan))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_FellanSuccess_Info()
{	
	AI_Output (other, self,"DIA_Alwin_FellanSuccess_15_00"); //Fellan wird nicht mehr hämmern.
	AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_01"); //Hörst du das? Kein Hämmern mehr. Endlich. Ich dachte schon, der Kerl hört nie auf.
	
	if (Npc_IsDead (Fellan) == FALSE) 
	{
		AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_02"); //Damit hast du mir einen großen Gefallen getan. Weißt du was, ich gebe dir dafür 30 Goldstücke.
		
		B_GiveInvItems (self, other, ItMi_Gold, 30);
		
		MIS_AttackFellan = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient); 
	}
	else 
	{
		MIS_AttackFellan = LOG_FAILED;
	};
};
//***************************************************
//		Perm Info
//***************************************************
INSTANCE DIA_Alwin_Endlos(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 8;
	condition	= DIA_Alwin_Endlos_Condition;
	information	= DIA_Alwin_Endlos_Info;
	permanent	= TRUE;
	description	= "Und, was machen die Schafe?";
};                       
FUNC INT DIA_Alwin_Endlos_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Alwin_Sheep)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_Endlos_Info()
{	
	AI_Output (other, self,"DIA_Alwin_Endlos_15_00"); //Und, was machen die Schafe?
	
	if (MIS_AttackFellan != LOG_SUCCESS)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_01"); //Das Gehämmer von Fellan macht sie noch verrückt. Irgendwann werden sie völlig durchdrehen.
		
	}
	else if (Kapitel <= 2)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_02"); //Die Schafe fressen und werden immer fetter. Genau wie meine Frau. HAHAHA (lacht schallend)
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_03"); //Eines werde ich wohl schlachten müssen. Für die Henkersmahlzeit!
			AI_Output (other, self,"DIA_Alwin_Endlos_15_04"); //Wofür?
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_05"); //Für den Söldner, der den Paladin ermordet hat. Er wird natürlich hingerichtet.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_06"); //Ich muss mich nur noch entscheiden, welches von den Viechern auf die Schlachtbank kommt.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_07"); //Lucy ist echt glücklich, dass sie noch am Leben ist.
			AI_Output (other, self,"DIA_Alwin_Endlos_15_08"); //Ich dachte, Lucy ist deine Frau.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_09"); //Das stimmt, aber ich hab das Schaf auch Lucy genannt. Ich meine das Schaf, welches für die Henkermahlzeit von diesem Bennet vorgesehen war.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_10"); //Aber das hat sich ja erledigt. Lucy wird sich freuen.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_11"); //Auf Dauer ist es ganz schön langweilig, den Schafen beim Fressen zuzusehen.
	}
	else	//Kapitel 5
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_12"); //Ich nehme Abschied von ihnen. Lord Hagen hat angeordnet, dass alle Schafe als Proviant für seine Armee dienen sollen.
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_13"); //Na ja, dann habe ich wenigstens wieder mehr Zeit für meine Frau.
	};
};



