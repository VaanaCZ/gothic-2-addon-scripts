// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_BL_BDT_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_Addon_BL_BDT_1_EXIT_Condition;
	information	= DIA_Addon_BL_BDT_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Addon_BL_BDT_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 									Chef
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Chef(C_INFO)
{
	nr			= 2;
	condition	= DIA_Addon_BL_BDT_1_Chef_Condition;
	information	= DIA_Addon_BL_BDT_1_Chef_Info;
	permanent	= TRUE;
	description = "°Wer hat hier das Sagen?   °<<FTSTAMP005687017_CINFODESCRIPTION>>";
};                       

FUNC INT DIA_Addon_BL_BDT_1_Chef_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_1_Chef_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Chef_15_00");//°Wer hat hier das Sagen?   °<<FTSTAMP005688061_AIOUTPUT>>
	
	if (RavenIsDead == TRUE)
	{
		if Npc_IsDead (Thorus)
		{
			AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_01");//°Soviele Anführer kommen und gehen ... da verliert man schon mal den Überblick.   °<<FTSTAMP005689063_AIOUTPUT>>
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_02");//°Ich glaube, Thorus ist jetzt unser Chef ...   °<<FTSTAMP005690063_AIOUTPUT>>
		};
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_03");//°Raven ist unser Anführer. Er hat uns hergeführt und das Lager aufgebaut.   °<<FTSTAMP005691062_AIOUTPUT>>
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_04");//°Er kontrolliert die Mine, denn sonst hätten sich die Hunde längst wegen dem Gold umgebracht.   °<<FTSTAMP005692062_AIOUTPUT>>
	};
};
// *************************************************************************
// 									Lager (nicht perm!)
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Lager(C_INFO)
{
	nr			= 3;
	condition	= DIA_Addon_BL_BDT_1_Lager_Condition;
	information	= DIA_Addon_BL_BDT_1_Lager_Info;
	permanent	= FALSE;
	description = "°Was weißt du über das Lager?   °<<FTSTAMP005693017_CINFODESCRIPTION>>";
};                       

FUNC INT DIA_Addon_BL_BDT_1_Lager_Condition()
{	
	if ((Sklaven_Flucht == FALSE)
	|| !Npc_IsDead (Raven))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_BL_BDT_1_Lager_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Lager_15_00");//°Was weißt du über das Lager?   °<<FTSTAMP005694062_AIOUTPUT>>
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager_01_01");//°Nachdem klar war, dass es hier eine Goldmine gibt, haben sich die Penner wohl ganz schön auf's Maul gehauen.   °<<FTSTAMP005695062_AIOUTPUT>>
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager_01_02");//°Raven hat dann die Schlimmsten von ihnen umgebracht und den Rest aus der Mine geworfen.   °<<FTSTAMP005696062_AIOUTPUT>>
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager_01_03");//°Seitdem darf niemand mehr in den oberen Bereich. Er hat sogar Gefangene anschleppen lassen, die in der Mine schürfen.   °<<FTSTAMP005697062_AIOUTPUT>>
	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};
// *************************************************************************
// 									Lager2
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Lager2(C_INFO)
{
	nr			= 3;
	condition	= DIA_Addon_BL_BDT_1_Lager2_Condition;
	information	= DIA_Addon_BL_BDT_1_Lager2_Info;
	permanent	= TRUE;
	description = "°Kannst du mir mehr über das Lager erzählen?   °<<FTSTAMP005698017_CINFODESCRIPTION>>";
};                       

FUNC INT DIA_Addon_BL_BDT_1_Lager2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BL_BDT_1_Lager)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_BL_BDT_1_Lager2_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Lager2_15_00");//°Was weißt du über das Lager?   °<<FTSTAMP005699063_AIOUTPUT>>
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager2_01_01");//°Wenn du jemanden angreifst, werden sich ALLE auf dich stürzen.   °<<FTSTAMP005700063_AIOUTPUT>>
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager2_01_02");//°Es sei denn, du hast einen Grund, dich mit jemandem anzulegen. Dann wird sich keiner einmischen.   °<<FTSTAMP005701063_AIOUTPUT>>
};
// *************************************************************************
// 								News
// *************************************************************************
instance DIA_Addon_BL_BDT_1_News(C_INFO)
{
	nr			= 4;
	condition	= DIA_Addon_BL_BDT_1_News_Condition;
	information	= DIA_Addon_BL_BDT_1_News_Info;
	permanent	= TRUE;
	description = "°Gibt's was Neues?    °<<FTSTAMP005702017_CINFODESCRIPTION>>";
};                       

FUNC INT DIA_Addon_BL_BDT_1_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_1_News_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_News_15_00");//°Gibt's was Neues?   °<<FTSTAMP005703061_AIOUTPUT>>
	
	if (RavenIsDead == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_News_01_01");//°Raven ist tot. Was sollen wir denn jetzt machen?   °<<FTSTAMP005704062_AIOUTPUT>>
	};
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_News_01_02");//°Die Piraten wollen uns nicht mehr zum Festland bringen, weil sie für ihre letzten Transporte nicht bezahlt wurden.   °<<FTSTAMP005705061_AIOUTPUT>>
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_News_01_03");//°Wir sollten ein oder zwei von ihnen aufspießen, dann werden die anderen uns garantiert wieder übersetzen.   °<<FTSTAMP005706061_AIOUTPUT>>
};
// *************************************************************************
// 									Sklaven
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Sklaven(C_INFO)
{
	nr			= 5;
	condition	= DIA_Addon_BL_BDT_1_Sklaven_Condition;
	information	= DIA_Addon_BL_BDT_1_Sklaven_Info;
	permanent	= TRUE;
	description = "°Was weißt du über die Gefangenen?   °<<FTSTAMP005707017_CINFODESCRIPTION>>";
};  
FUNC INT DIA_Addon_BL_BDT_1_Sklaven_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BL_BDT_1_Lager)
	&& ((Sklaven_Flucht == FALSE)
	|| (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_BL_BDT_1_Sklaven_Info()
{	
	 
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Sklaven_15_00");//°Was weißt du über die Gefangenen?   °<<FTSTAMP005708064_AIOUTPUT>>
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_01");//°Raven will irgendwas ausgebuddeln. Erst hat er die Banditen das machen lassen, aber dabei sind zuviele draufgegangen.   °<<FTSTAMP005709064_AIOUTPUT>>
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_02");//°Deshalb hat er die Gefangenen geholt - wenn die krepieren, spielt das keine Rolle.   °<<FTSTAMP005710064_AIOUTPUT>>
	
	if (BDT_1_Ausbuddeln == FALSE)
	{
		AI_Output (other, self, "DIA_Addon_BL_BDT_1_Sklaven_15_03");//°Was will Raven ausbuddeln?   °<<FTSTAMP005711065_AIOUTPUT>>
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_04");//°Keine Ahnung, aber ihm geht's wohl um mehr als das Gold.   °<<FTSTAMP005712065_AIOUTPUT>>
		BDT_1_Ausbuddeln = TRUE;
	};
};
FUNC VOID B_AssignAmbientInfos_Addon_BL_BDT_1 (var c_NPC slf)
{
	DIA_Addon_BL_BDT_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Chef.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager.npc				= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_News.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Sklaven.npc				= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager2.npc				= Hlp_GetInstanceID(slf);
};




