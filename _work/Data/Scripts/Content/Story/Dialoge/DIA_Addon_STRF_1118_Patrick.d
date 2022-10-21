//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_EXIT   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 999;
	condition   = DIA_Addon_Patrick_EXIT_Condition;
	information = DIA_Addon_Patrick_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Patrick_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_Hi   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 2;
	condition   = DIA_Addon_Patrick_Hi_Condition;
	information = DIA_Addon_Patrick_Hi_Info;
	permanent   = FALSE;
	description = "Ich komme im Auftrag der Wassermagier.";
};
FUNC INT DIA_Addon_Patrick_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_00");//Ich komme im Auftrag der Wassermagier. Ich bin hier, um euch zu befreien.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_01");//(mißtrauisch) So? Und warum sollte ich dir das glauben?
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_02");//Willst du hier raus oder nicht?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_03");//Natürlich will ich hier raus - aber ...
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_04");//Vatras hat mich geschickt. Wenn dir das nicht reicht, könnt ihr von mir aus alle in diesem Loch verschimmeln.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_05");//(eilig) In Ordnung, ich glaube dir.
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_06");//(verblüfft) Ja? Das ging schneller als erwartet. Okay, jetzt brauchen wir nur noch einen Plan.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_07");//Ein Fluchtversuch ist 'ne riskante Sache. William hat's versucht und ist dabei draufgegangen.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_08");//Die Gefangenen sind Bauern und Arbeiter - sie vertrauen mir zwar, aber sie werden sich nicht auf eine Flucht einlassen.
		
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"Soll ich euch etwa 'ne Begnadigung von Raven holen?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"Muss ich etwa alle Banditen töten, bevor ihr euch bewegt?",DIA_Addon_Patrick_Hi_Kill);
};
FUNC VOID B_Say_Patrick_Plan()
{
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_00");//Aber das kann nicht der Plan sein.
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_01");//Sieh einfach zu, dass die Wachen uns nicht angreifen, dann verschwinden wir von hier.
	AI_Output (other, self, "DIA_Addon_Patrick_Plan_15_02");//Okay, ich werde mich um darum kümmern. Sag den anderen, sie sollen sich bereit halten.
	
	
	B_LogEntry (Topic_Addon_Sklaven,"Die Sklaven werden keinen Fluchtversuch wagen. Ich muss einen Weg finden, damit sie das Lager unbehelligt verlassen können.");
};
FUNC VOID DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Raven_15_00");//Soll ich euch etwa 'ne Begnadigung von Raven holen?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Raven_07_01");//(grinst) Das wäre nicht schlecht.
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};
FUNC VOID DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Kill_15_00");//Muss ich etwa alle Banditen töten, bevor ihr euch bewegt?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Kill_07_01");//(erschrocken) Das wäre ja Wahnsinn!
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};

//---------------------------------------------------------------------
//	ready
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_ready   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 2;
	condition   = DIA_Addon_Patrick_ready_Condition;
	information = DIA_Addon_Patrick_ready_Info;
	permanent   = FALSE;
	description = "Alles klar, ihr könnt abhauen.";
};
FUNC INT DIA_Addon_Patrick_ready_Condition()
{	
	if (Ready_Togo == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Patrick_Hi))
	
	|| (Npc_IsDead (PrisonGuard)
	&&  Npc_IsDead (Bloodwyn)
	&&  Npc_KnowsInfo (other,DIA_Addon_Thorus_Answer)) 
	
	|| (Npc_IsDead (Thorus)
	&&  Npc_IsDead (Bloodwyn)
	&&  Npc_IsDead (PrisonGuard))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Patrick_ready_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_00");//Alles klar, ihr könnt abhauen.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_01");//Gut, ich kenne eine Höhle im Sumpf, da werden wir uns erst mal sammeln. Aber wie geht's dann weiter?
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_02");//Verlasst den Sumpf Richtung Südwesten. Bei den alten Tempelruinen haben die Wassermagier ihr Lager aufgeschlagen.
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_03");//Sie werden euch einen Weg aus diesem Tal zeigen.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_04");//Danke, vielen Dank. (hebt an) Wir alle stehen tief in deiner ...
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_05");//Schon gut.
	
	Sklaven_Flucht = TRUE; 
	B_GivePlayerXP (XP_Addon_Flucht);
	
	AI_StopProcessInfos (self);
	
	//AI_UseMob			(self,"ORE",-1);

	Npc_ExchangeRoutine (self,"FLUCHT");
	
	B_StartOtherRoutine (Telbor, "FLUCHT");
	B_StartOtherRoutine (Tonak, "FLUCHT");
	B_StartOtherRoutine (Pardos,"FLUCHT");
	B_StartOtherRoutine (Monty,"FLUCHT");	
	
	B_StartOtherRoutine (Buddler_1,"WORK");
	B_StartOtherRoutine (Buddler_2,"WORK");
	B_StartOtherRoutine (Buddler_3,"WORK");
	
	B_RemoveNpc (STRF_1128_Addon_Sklave);
	B_RemoveNpc (STRF_1129_Addon_Sklave);
	B_RemoveNpc (STRF_1130_Addon_Sklave);
	
	B_RemoveNpc (STRF_1136_Addon_Sklave);
	B_RemoveNpc (STRF_1137_Addon_Sklave);
	B_RemoveNpc (STRF_1138_Addon_Sklave);
	B_RemoveNpc (STRF_1139_Addon_Sklave);
	B_RemoveNpc (STRF_1140_Addon_Sklave);
	
	
};
//---------------------------------------------------------------------
//	Killer
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_Killer   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 2;
	condition   = DIA_Addon_Patrick_Killer_Condition;
	information = DIA_Addon_Patrick_Killer_Info;
	permanent   = FALSE;
	description = "Die Wache ist erledigt, ihr könnt abhauen.";
};
FUNC INT DIA_Addon_Patrick_Killer_Condition()
{	
	if Npc_IsDead (PrisonGuard)
	&& (Ready_Togo == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Patrick_Hi))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Patrick_Killer_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Killer_15_00");//Die Wache ist erledigt, ihr könnt abhauen.
	AI_Output (self, other, "DIA_Addon_Patrick_Killer_07_01");//Und was passiert, wenn wir die Mine verlassen? Dann werden uns die anderen Wachen abschlachten. Nein, das ist zu riskant.
};
//---------------------------------------------------------------------
//	Hoehle
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Patrick_Hoehle   (C_INFO)
{
	npc         = STRF_1118_Addon_Patrick;
	nr          = 2;
	condition   = DIA_Addon_Patrick_Hoehle_Condition;
	information = DIA_Addon_Patrick_Hoehle_Info;
	permanent   = TRUE;
	description = "Wollt ihr nicht abhauen?";
};
FUNC INT DIA_Addon_Patrick_Hoehle_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_BL_HOEHLE_04") <= 1000)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Patrick_Hoehle_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hoehle_15_00");//Wollt ihr nicht abhauen?
	AI_Output (self, other, "DIA_Addon_Patrick_Hoehle_07_01");//Doch natürlich. Wir warten nur noch auf einen günstigen Moment.
};



	
	
