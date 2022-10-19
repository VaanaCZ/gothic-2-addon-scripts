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
	description = "Pos�laj� m� m�gov� vody. M�m t� osvobodit.";
};
FUNC INT DIA_Addon_Patrick_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Patrick_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_00");//Pos�laj� m� m�gov� vody. M�m v�s osvobodit.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_01");//(opatrn�) V�n�? A pro� bych ti m�l v��it?
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_02");//Chcete se odsud dostat, nebo ne?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_03");//Samoz�ejm� �e jo, ale...
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_04");//Pos�l� m� Vatras, a to by ti m�lo sta�it. Jinak si tu klidn� m��ete v�ichni shn�t v t�hle d��e, mn� je to fuk.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_05");//(rychle) No dob�e, v���m ti.
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_15_06");//(zmaten�) V�n�? Wow, to �lo rychleji, ne� jsem si myslel. Prima, tak te� je�t� pot�ebujeme pl�n.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_07");//Pokus o �t�k je hodn� riskantn�. William to zkusil a koupil to.
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_07_08");//Zdej�� v�zni jsou vesm�s sam� roln�ci a d�ln�ci � v��� mi, ale sami se ut�ct neodv��.
		
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"A co m�m podle tebe d�lat? Vyprosit ti u Havrana propu�t�n�?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice (DIA_Addon_Patrick_Hi,"To m�m vyml�tit v�ecky bandity, aby ses v�bec pohnul?",DIA_Addon_Patrick_Hi_Kill);
};
FUNC VOID B_Say_Patrick_Plan()
{
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_00");//To ale nen� ��dn� pl�n.
	AI_Output (self, other, "DIA_Addon_Patrick_Plan_07_01");//Postarej se, aby n�s nenapadly str�e, a pak odsud zmiz�me.
	AI_Output (other, self, "DIA_Addon_Patrick_Plan_15_02");//Dob�e, za��d�m to. Vy�i� ostatn�m, a� se p�iprav�.
	
	
	B_LogEntry (Topic_Addon_Sklaven,"Otroci se neodv�� uniknout. Mus�m naj�t n�jak� zp�sob, jak je nepozorovan� dostat z t�bora.");
};
FUNC VOID DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Raven_15_00");//Co m�m ud�lat � vyprosit ti u Havrana milost?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Raven_07_01");//(�kleb� se) To nen� �patnej n�pad.
	B_Say_Patrick_Plan();
	Info_ClearChoices (DIA_Addon_Patrick_Hi);
};
FUNC VOID DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output (other, self, "DIA_Addon_Patrick_Hi_Kill_15_00");//To se odsud nehnete, dokud nepobiju v�ecky bandity?
	AI_Output (self, other, "DIA_Addon_Patrick_Hi_Kill_07_01");//(vyd�en�) To by bylo ��lenstv�!
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
	description = "V�ecko je v pohod�, u� se m��ete vypa�it.";
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
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_00");//V�ecko je v pohod�, m��ete se vypa�it.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_01");//V�born�. Zn�m v ba�in� jednu jeskyni, kde se zat�m m��em ukr�t. Jen�e co d�l?
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_02");//B�te z ba�iny sm�rem k jihoz�padu. Vodn� m�gov� si z��dili t�bor kousek od rozvalin star�ho chr�mu.
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_03");//Uk�ou v�m cestu z tohohle �dol�.
	AI_Output (self, other, "DIA_Addon_Patrick_ready_07_04");//D�ky, moc ti d�kuju. (za��n� �e�nit) Jsme ti v�ichni hluboce zav�z�ni...
	AI_Output (other, self, "DIA_Addon_Patrick_ready_15_05");//To nic.
	
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
	description = "Str� u� to m� za sebou, m��e� j�t.";
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
	AI_Output (other, self, "DIA_Addon_Patrick_Killer_15_00");//Str�e jsou mrtv�, u� m��ete j�t.
	AI_Output (self, other, "DIA_Addon_Patrick_Killer_07_01");//A co se stane, a� opust�me d�l? Ostatn� str�e n�s rozsekaj�! Ne, je to moc riskantn�.
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
	description = "Vy nechcete odej�t?";
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
	AI_Output (other, self, "DIA_Addon_Patrick_Hoehle_15_00");//To se odsud nechcete dostat?
	AI_Output (self, other, "DIA_Addon_Patrick_Hoehle_07_01");//Samoz�ejm� �e jo, jen �ek�me na spr�vnou p��le�itost.
};



	
	
