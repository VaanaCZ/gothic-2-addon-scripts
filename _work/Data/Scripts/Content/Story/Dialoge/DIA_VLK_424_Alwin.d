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
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_01"); //Mir geh�rt nur das eine, das auf den Namen Lucy h�rt. (lacht) Das ist meine Frau - die Lucy.
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_02"); //Die Schafe geh�ren der Miliz. Alle Schafe, die sie von den Bauern einkassieren, bringen sie zu mir.
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
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_00"); //Junge, das Geh�mmer von diesem Irren macht mich total fertig!
	AI_Output (other, self,"DIA_Alwin_Fellan_15_01"); //Wen meinst du?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_02"); //H�rst du nicht das H�mmern? Wer h�mmert denn den ganzen Tag im Hafenviertel?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_03"); //Ich meine den irren Fellan. Der h�mmert jeden Tag an seiner H�tte herum.
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
	description = "Ich k�nnte mich um Fellan k�mmern ...";
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
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_00"); //Ich k�nnte mich um Fellan k�mmern ...
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_01"); //Du willst mir helfen? Was hast du davon?
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_02"); //Sag du's mir.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_03"); //Ach so sieht's aus! Na gut - wenn du es schaffst, dass er mit dem Geh�mmer aufh�rt, zahle ich dir 25 Goldst�cke.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_04"); //Aber eins sag ich dir gleich - mit dem Kerl kannst du nicht reden. Der ist irre. Da helfen nur ein paar ordentliche Schl�ge!
	
	MIS_AttackFellan = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Alwin,LOG_RUNNING);
	B_LogEntry (TOPIC_Alwin,"Alwin will das ich Fellan dazu bringe, das er mit dem H�memrn aufh�rt. Es w�re bestimmt nicht angebracht, ihn zu t�ten.");
		
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
	Info_AddChoice (DIA_Alwin_FellanRunning, "Ich werd sehen, was ich machen kann...", DIA_Alwin_FellanRunning_Ok);
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		Info_AddChoice (DIA_Alwin_FellanRunning, "Wenn ich ihn verpr�gele bekomme ich doch �rger mit der Miliz...", DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Ok_15_00"); //Ich werd sehen, was ich machen kann ...
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_Ok_12_01"); //Du kannst es dir ja noch �berlegen. Denk daran, ich zahle dir 25 Goldm�nzen.
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Problems_15_00"); //Wenn ich ihn verpr�gele, bekomme ich doch �rger mit der Miliz ...
	AI_Output (self ,other,"DIA_Alwin_Add_12_00"); //Hier im Hafenviertel k�mmert sich keiner um Schl�gereien...
	AI_Output (self ,other,"DIA_Alwin_Add_12_01"); //Nur wenn du hier was klaust, oder dich an den Schafen vergreifst, bekomst du �rger.

	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_01"); //Der irre Fellan wird nicht zur Miliz rennen und dich anzeigen. Du k�nntest h�chstens ein Problem bekommen, wenn seine Nachbarn was davon mitbekommen.
	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_02"); //Schl�gereien sind hier nicht gerne gesehen, und je mehr Zeugen es gibt, desto schlimmer wird die Sache.
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
	description	= "Fellan wird nicht mehr h�mmern.";
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
	AI_Output (other, self,"DIA_Alwin_FellanSuccess_15_00"); //Fellan wird nicht mehr h�mmern.
	AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_01"); //H�rst du das? Kein H�mmern mehr. Endlich. Ich dachte schon, der Kerl h�rt nie auf.
	
	if (Npc_IsDead (Fellan) == FALSE) 
	{
		AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_02"); //Damit hast du mir einen gro�en Gefallen getan. Wei�t du was, ich gebe dir daf�r 30 Goldst�cke.
		
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
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_01"); //Das Geh�mmer von Fellan macht sie noch verr�ckt. Irgendwann werden sie v�llig durchdrehen.
		
	}
	else if (Kapitel <= 2)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_02"); //Die Schafe fressen und werden immer fetter. Genau wie meine Frau. HAHAHA (lacht schallend)
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_03"); //Eines werde ich wohl schlachten m�ssen. F�r die Henkersmahlzeit!
			AI_Output (other, self,"DIA_Alwin_Endlos_15_04"); //Wof�r?
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_05"); //F�r den S�ldner, der den Paladin ermordet hat. Er wird nat�rlich hingerichtet.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_06"); //Ich muss mich nur noch entscheiden, welches von den Viechern auf die Schlachtbank kommt.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_07"); //Lucy ist echt gl�cklich, dass sie noch am Leben ist.
			AI_Output (other, self,"DIA_Alwin_Endlos_15_08"); //Ich dachte, Lucy ist deine Frau.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_09"); //Das stimmt, aber ich hab das Schaf auch Lucy genannt. Ich meine das Schaf, welches f�r die Henkermahlzeit von diesem Bennet vorgesehen war.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_10"); //Aber das hat sich ja erledigt. Lucy wird sich freuen.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_11"); //Auf Dauer ist es ganz sch�n langweilig, den Schafen beim Fressen zuzusehen.
	}
	else	//Kapitel 5
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_12"); //Ich nehme Abschied von ihnen. Lord Hagen hat angeordnet, dass alle Schafe als Proviant f�r seine Armee dienen sollen.
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_13"); //Na ja, dann habe ich wenigstens wieder mehr Zeit f�r meine Frau.
	};
};



