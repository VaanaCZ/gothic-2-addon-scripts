//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_EXIT   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 999;
	condition   = DIA_Addon_Garaz_EXIT_Condition;
	information = DIA_Addon_Garaz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Garaz_PICKPOCKET (C_INFO)
{
	npc			= BDT_10024_Addon_Garaz;
	nr			= 900;
	condition	= DIA_Addon_Garaz_PICKPOCKET_Condition;
	information	= DIA_Addon_Garaz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Garaz_PICKPOCKET_Condition()
{
	C_Beklauen (66, 80);
};
 
FUNC VOID DIA_Addon_Garaz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garaz_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garaz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garaz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garaz_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garaz_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
	
func void DIA_Addon_Garaz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garaz_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Probleme
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Probleme   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 2;
	condition   = DIA_Addon_Garaz_Probleme_Condition;
	information = DIA_Addon_Garaz_Probleme_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Garaz_Probleme_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garaz_Probleme_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_00");//Warte mal.
	AI_Output (other, self, "DIA_Addon_Garaz_Probleme_15_01");//Gibt's Probleme?
	AI_Output (self, other, "DIA_Addon_Garaz_Probleme_08_02");//Minecrawler. Jede Menge Minecrawler. Wir sind hier auf ein Nest gestoßen.
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Hi   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Hi_Condition;
	information = DIA_Addon_Garaz_Hi_Info;
	permanent   = FALSE;
	description = "Warum greifen wir die Crawler nicht an? ";
};
FUNC INT DIA_Addon_Garaz_Hi_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&& (Minecrawler_Killed < 9)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_00");//Warum greifen wir die Crawler nicht an?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_01");//Hab ich auch gefragt. Aber die Garde hatte 'Wichtigeres' zu tun.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_02");//Bloodwyn es mir überlassen, dieses Problem aus der Welt zu schaffen.
	AI_Output (other, self, "DIA_Addon_Garaz_Hi_15_03");//Ich schätze, du hast nicht vor, dich mit den Crawlern anzulegen.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_04");//Warum sollte ich? Damit wir an das Gold kommen, das in der Höhle ist?
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_05");//Das Meiste wird sich eh Bloodwyn reinziehen. Und für das bisschen, das ich kriege, riskiere ich nicht meinen Hals.
	AI_Output (self, other, "DIA_Addon_Garaz_Hi_08_06");//Wenn DU dich mit den Crawlern anlegen willst - lass dich nicht aufhalten. Nur - lock sie nicht alle hier rauf, ja?
	
};
//---------------------------------------------------------------------
//	Info Bloodwyn
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Bloodwyn   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 8;
	condition   = DIA_Addon_Garaz_Bloodwyn_Condition;
	information = DIA_Addon_Garaz_Bloodwyn_Info;
	permanent   = FALSE;
	description = "Kannst du mir noch was über Bloodwyn sagen?";
};
FUNC INT DIA_Addon_Garaz_Bloodwyn_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Garaz_Hi)
	&& (Minecrawler_Killed < 9)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Bloodwyn_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_00");//Kannst du mir noch was über Bloodwyn sagen?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_01");//Ja. Er ist ein goldgieriger Bastard. Er kontrolliert jede neue Ader und jeden Klumpen.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_02");//Für Gold ist ihm kein Weg zu weit. Aber wir sind ihm scheißegal.
	AI_Output (other, self, "DIA_Addon_Garaz_Bloodwyn_15_03");//Und sonst?
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_04");//Er hält sich für den Größten und kann's nicht leiden, wenn jemand besser da steht als er. Okay - ich würde trotzdem nicht gegen ihn antreten wollen.
	AI_Output (self, other, "DIA_Addon_Garaz_Bloodwyn_08_05");//Geh ihm am Besten aus dem Weg und reize ihn nicht - es sei denn, du willst, dass er wütend wird und seine Beherrschung verliert ...
	
	B_LogEntry (Topic_Addon_Tempel,"Bloodwyn wird bestimmt den Tempel verlassen, wenn er mitkriegt, das in der Mine eien neue Goldader gefunden wurde.");
	B_LogEntry (Topic_Addon_Tempel,"Wenn Bloodwyn gereizt wird, verliert er die Kontrolle. Das wird mir bestimmt nützlich sein."); 
};
//---------------------------------------------------------------------
//	Info Sieg
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Sieg   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Sieg_Condition;
	information = DIA_Addon_Garaz_Sieg_Info;
	permanent   = FALSE;
	description	= "Die Crawler sind erledigt.";
};
FUNC INT DIA_Addon_Garaz_Sieg_Condition()
{	
	if  (Minecrawler_Killed >= 9)
	&&  !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Garaz_Sieg_15_00");//So, das sollte es gewesen sein. Die Crawler sind erledigt.
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_01");//Bloodwyn ist schon auf dem Weg. Das ist doch das, was du wolltest, oder?
	AI_Output (self, other, "DIA_Addon_Garaz_Sieg_08_02");//Ich meine, du hast die Crawler abgemetzelt, damit Bloodwyn herkommt. Also, was immer du vorhast, tu es JETZT.
	
	B_StartOtherRoutine (Bloodwyn,"GOLD");	
	
};
//---------------------------------------------------------------------
//	Info Blood
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Blood   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Blood_Condition;
	information = DIA_Addon_Garaz_Blood_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Blood_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	&& Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Blood_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_00");//Du hast es diesem Penner ja ordentlich gezeigt. Saubere Leistung.
	AI_Output (self, other, "DIA_Addon_Garaz_Blood_08_01");//Dann werde ich mich mal in der Höhle umsehen.
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine (self,"GOLD");
	B_StartOtherRoutine (Thorus, "TALK");
};
//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Garaz_Gold   (C_INFO)
{
	npc         = BDT_10024_Addon_Garaz;
	nr          = 3;
	condition   = DIA_Addon_Garaz_Gold_Condition;
	information = DIA_Addon_Garaz_Gold_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Garaz_Gold_Condition()
{	
	if (Npc_GetDistToWP (self, "ADW_MINE_MC_GARAZ") <= 500)
	&&  Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garaz_Gold_Info()
{
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_00");//Wow, Mann, hier gibt's echt 'ne Menge Gold.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_01");//Um an die Brocken ganz oben zu kommen, bräuchten wir schon eine Leiter.
	AI_Output (self, other, "DIA_Addon_Garaz_Gold_08_02");//Aber seit dem Fall der Barriere benutzt niemand mehr Leitern ... ist eigentlich sehr schade ...
};




