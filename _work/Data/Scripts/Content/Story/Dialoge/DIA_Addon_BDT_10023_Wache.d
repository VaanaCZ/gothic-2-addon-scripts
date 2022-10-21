//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_EXIT   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 999;
	condition   = DIA_Addon_10023_Wache_EXIT_Condition;
	information = DIA_Addon_10023_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10023_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_Hi   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10023_Wache_Hi_Condition;
	information = DIA_Addon_10023_Wache_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_10023_Wache_Hi_Condition()
{	
	if (Npc_GetDistToNpc (self,other) <= 300)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10023_Wache_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_00");//Eh, ¿a dónde vas? ¿Quieres pasar por este pasadizo?
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_01");//Claro, ¿por qué no?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_02");//Allí atrás hay más esclavos. Por lo que a mí respecta, puedes entrar, pero no les golpees demasiado fuerte o no podrán trabajar.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_03");//Después de todo, no queremos que pierdan el tiempo. Tienen que extraer oro.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_04");//Comprendo. ¿Quién lo ordena?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_05");//Es una orden directa de Bloodwyn.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_06");//Creía que Raven era quien mandaba.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_07");//Sí, pero le dio los esclavos a Bloodwyn. Ya no los necesita para nada.
	
	Pardos.attribute[ATR_HITPOINTS] 		= 70;
	B_LogEntry (Topic_Addon_Sklaven,"Raven ya no necesita a los esclavos. Ahora pertenecen a Bloodwyn."); 
};
//---------------------------------------------------------------------
//	Info go
//---------------------------------------------------------------------
var int PrisonGuard_Rules;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_go   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 99;
	condition   = DIA_Addon_10023_Wache_go_Condition;
	information = DIA_Addon_10023_Wache_go_Info;
	permanent   = TRUE;
	description = "¡Deja marchar a los esclavos!";
};
FUNC INT DIA_Addon_10023_Wache_go_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_go_Info()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_15_00");//¡Deja marchar a los esclavos!
	
	if (PrisonGuard_Rules == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_01");//Mira, Bloodwyn es quien manda aquí. Los esclavos le pertenecen, así que él es quien debe liberarlos.
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_02");//Además, Thorus también tiene algo que opinar al respecto. ¿Y tú?
		PrisonGuard_Rules = TRUE;
		B_LogEntry (Topic_Addon_Sklaven,"Sólo Bloodwyn y Thorus tienen derecho a liberar a los esclavos. ");
	};
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_03");//¿Tienes ALGO que decir?
	
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	Info_AddChoice (DIA_Addon_10023_Wache_go,DIALOG_BACK,DIA_Addon_10023_Wache_go_BACK);
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"He tenido una charla con Thorus.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else if Npc_IsDead (Bloodwyn)
	&& (Npc_HasItems (other,ItMi_Addon_Bloodwyn_Kopf) >=1)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"(enseña la cabeza de Bloodwyn)",DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Yo decido QUIÉN entra en la mina.",DIA_Addon_10023_Wache_go_WER);
	};
};	
FUNC VOID DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
FUNC VOID DIA_Addon_10023_Wache_go_WER()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_WER_15_00");//Yo decido QUIÉN entra en la mina.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_WER_11_01");//Estás cumpliendo la antigua función de Esteban, así que no tienes NADA que opinar. Desaparece.
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
//----------------------------------------
var int Wache_einmal;
//----------------------------------------
FUNC VOID DIA_Addon_10023_Wache_go_Blood()
{
	
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_00");//Toma, ¿es suficiente?
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_01");//(con gesto de asco) Aparta eso. No quiero VERLO.
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_02");//Más vale que dejes marchar a los esclavos AHORA.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_03");//Un momento. Bloodwyn no es el único que tiene algo que decir. Mientras no tenga una orden de Thorus, aquí no se libera a nadie.
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
		Info_AddChoice (DIA_Addon_10023_Wache_go,"He tenido una charla con Thorus.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if (Wache_einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_04");//Pero acabas de decir que los esclavos pertenecen a Bloodwyn.
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_05");//Sí, pero también he dicho que no liberaría a nadie sin una orden de Thorus.
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_06");//Eres uno de esos tipos que no mueve un dedo sin una orden, ¿eh?
			Wache_einmal = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_07");//Sí, pero también he dicho
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_08");//…vale, ya me sé el resto.
		};
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	}; 
	
	
};
FUNC VOID DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_00");//He hablado con Thorus. Ha ordenado liberar a los esclavos.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_01");//Muy bien, si así lo ordena Thorus. Pero me pregunto por qué habrá tomado una decisión as
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_02");//…pero no te pagan para hacer preguntas.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_03");//Vale, vale. Veo que ya no hago falta, así que voy a por un poco de estofado.
	
	Ready_Togo = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SOUP");
};
