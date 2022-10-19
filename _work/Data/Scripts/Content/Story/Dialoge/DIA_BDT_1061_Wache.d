// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_1061_Wache_EXIT   (C_INFO)
{
	npc         = BDT_1061_Wache;
	nr          = 999;
	condition   = DIA_1061_Wache_EXIT_Condition;
	information = DIA_1061_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_1061_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_1061_Wache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  	Hallo
// ************************************************************
INSTANCE DIA_1061_Wache_Hallo   (C_INFO)
{
	npc         = BDT_1061_Wache;
	nr          = 1;
	condition   = DIA_1061_Wache_Hallo_Condition;
	information = DIA_1061_Wache_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_1061_Wache_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_1061_Wache_Hallo_Info()
{
	AI_Output (self, other, "DIA_1061_Wache_Hallo_01_00");//Alto. Por aquí no puedes pasar.
	AI_Output (other, self, "DIA_1061_Wache_Hallo_15_01");//Quiero hablar con tu jefe.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_01_02");//(Irónico) Oh, así que quieres hablar con mi jefe. En ese caso sí te dejo pasar.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_01_03");//(Totalmente en serio) Pero solo si sabes cómo se llama... porque si no, me veré obligado a matarte. ¿Y bien?
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	Info_AddChoice (DIA_1061_Wache_Hallo,"Lee",DIA_1061_Wache_Hallo_Lee);
	if (Bdt13_Dexter_verraten == TRUE) 
	|| (Ranger_SCKnowsDexter == TRUE)//ADDON
	{
		Info_AddChoice (DIA_1061_Wache_Hallo,"Dexter",DIA_1061_Wache_Hallo_Dexter);
	};
	Info_AddChoice (DIA_1061_Wache_Hallo,"Diego",DIA_1061_Wache_Hallo_Diego);
	Info_AddChoice (DIA_1061_Wache_Hallo,"Ni idea.",DIA_1061_Wache_Hallo_Ahnung);
};
FUNC VOID DIA_1061_Wache_Hallo_Lee()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Lee_15_00");//Lee.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Lee_01_01");//¿Qué podría agregar? ¡Esto te va a costar la vida, tío!
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno,0);
};
FUNC VOID DIA_1061_Wache_Hallo_Dexter()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Dexter_15_00");//Dexter.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_01");//Bueno... supongo que conoces al jefe. Vale, te dejaré pasar. Pero te lo advierto.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_02");//Si te acercas demasiado a alguien, no vas a salir vivo de aquí.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_03");//Así que respira hondo y deja quietas las armas. Encontrarás a Dexter en la casa.
	
	Knows_Dexter = TRUE;
	BanditGuard.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_1061_Wache_Hallo_Diego()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Diego_15_00");//Diego.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_01");//¡Exacto!
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_02");//No, solo estaba bromeando. No tienes ni idea de quién es mi jefe.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_03");//No hay ningún motivo para que no te mate.
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno,0);
};
FUNC VOID DIA_1061_Wache_Hallo_Ahnung()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Ahnung_15_00");//Ni idea.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Ahnung_01_01");//Entonces morirás sin saberlo.
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno,0);
};
// ************************************************************
// 			  Perm
//**************************************
INSTANCE DIA_1061_Wache_Perm   (C_INFO)
{
	npc         = BDT_1061_Wache;
	nr          = 2;
	condition   = DIA_1061_Wache_Perm_Condition;
	information = DIA_1061_Wache_Perm_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_1061_Wache_Perm_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_1061_Wache_Perm_Info()
{
	AI_Output (self, other, "DIA_1061_Wache_Perm_01_00");//Recuerda: si te andas con ojo saldrás vivo de aquí.
	AI_StopProcessInfos (self);
};
	 
	
