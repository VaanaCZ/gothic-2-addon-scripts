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
	description = "Je viens � vous de la part des Mages de l'eau.";
};
FUNC INT DIA_Addon_Patrick_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_00");//Je suis envoy� par les Mages de l'eau. Je vais vous d�livrer.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_01");//(m�fiant) Vraiment ? Et pourquoi je devrais vous croire ?
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_02");//Vous voulez sortir de l�, oui ou non ?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_03");//Bien s�r que je veux sortir - mais
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_04");//C'est Vatras qui m'envoie. Si �a ne vous suffit pas, vous pouvez bien rester � pourrir ici. Personnellement, je m'en fiche.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_05");//(vite) Tr�s bien je vous crois.
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_06");//(�tonn�) Vraiment ? Et bien, �a a �t� plus rapide que je ne pensais. Bon, il nous faut un plan.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_07");//C'est tr�s risqu� d'essayer de s'enfuir. William a essay� et il l'a pay� tr�s cher.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_08");//Les prisonniers sont des paysans et des ouvriers. Ils me font confiance mais on ne peut pas compter sur eux pour organiser notre fuite.
		
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"Que voulez-vous de moi ? Que j'obtienne le pardon de Raven pour vous ?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"Il va falloir que je tue tous les bandits pour que vous bougiez ?",DIA_Addon_Patrick_Hi_Kill);
};
FUNC VOID B_Say_Patrick_Plan()
{
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_00");//Il faut trouver autre chose.
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_01");//Veillez � ce que les gardes ne nous attaquent pas et nous, nous filerons d'ici.
	AI_Output (other, self, "DIA_Addon_Patrick_Plan_15_02");//D'accord, je m'en charge. Dites aux autres de se tenir pr�ts.
	
	
	B_LogEntry (Topic_Addon_Sklaven,"Les esclaves n'oseront pas tenter de s'�chapper. Je dois trouver un moyen de leur permettre de quitter le camp sans se faire attaquer.");
};
FUNC VOID DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Raven_15_00");//Que voulez-vous de moi ? Que j'obtienne le pardon de Raven pour vous ?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Raven_07_01");//(sourit) �a n'est pas une mauvaise id�e.
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};
FUNC VOID DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Kill_15_00");//Il va falloir que je tue tous les bandits pour que vous bougiez ?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Kill_07_01");//(effray�) Mais �a serait de la folie !
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
	description = "C'est bon, vous pouvez y aller.";
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
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_00");//C'est bon, vous pouvez y aller.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_01");//Fantastique. Je connais une grotte dans le marais o� nous pourrons nous r�fugier. Mais ensuite ?
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_02");//Quittez le marais par le sud-ouest. Les Mages de l'eau ont �tabli leur camp pr�s des ruines du vieux temple.
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_03");//Ils vous indiqueront comment sortir de cette vall�e.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_04");//Merci, merci beaucoup. (se lan�ant) Nous sommes tous profond�ment�.
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_05");//Ce n'est rien.
	
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
	description = "Je me suis d�barrass� du garde. Vous pouvez y aller.";
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
	AI_Output (other, self, "DIA_Addon_Patrick_Killer_15_00");//Je me suis d�barrass� du garde. Vous pouvez y aller.
	AI_Output (self, other, "DIA_Addon_Patrick_Killer_07_01");//Mais que va-t-il se passer quand nous aurons quitt� la mine ? Les autres gardes vont nous massacrer. Non, c'est trop risqu�.
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
	description = "Vous ne voulez pas partir ?";
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
	AI_Output (other, self, "DIA_Addon_Patrick_Hoehle_15_00");//Vous ne voulez pas partir ?
	AI_Output (self, other, "DIA_Addon_Patrick_Hoehle_07_01");//Bien s�r que si. Nous attendons seulement le moment propice.
};



	
	
