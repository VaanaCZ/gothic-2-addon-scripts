///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP1_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP1_EXIT_Condition;
	information = DIA_Karras_KAP1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Hello 		(C_INFO)
{
	npc			= KDF_503_Karras;
	nr          = 1;
	condition	= DIA_Karras_Hello_Condition;
	information	= DIA_Karras_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
func int DIA_Karras_Hello_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_NOVIZENCHASE != LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Karras_Hello_Info ()
{
	if (hero.guild == GIL_NOV)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_00"); //¿En qué puedo servirte, novicio?
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_01"); //¿En qué puedo servirte, hermano?
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_02"); //Los honorables guerreros de Innos rara vez se adentran en estas habitaciones?
		AI_Output			(self, other, "DIA_Karras_Hello_10_03"); //¿En qué puedo ayudarte?
	}
	else
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_04"); //(Con recelo) ¿Qué haces aquí?
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Mission
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Mission		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Mission_Condition;
	information	 = 	DIA_Karras_Mission_Info;
	permanent    =  FALSE;
	description	 = 	"He venido a leer las escrituras.";
};
func int DIA_Karras_Mission_Condition ()
{	
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Karras_Mission_Info ()
{
	AI_Output (other, self, "DIA_Karras_Mission_15_00"); //He venido a leer las escrituras.
	AI_Output (self, other, "DIA_Karras_Mission_10_01"); //Entiendo. Si tus tediosos estudios te dejan un rato libre, ven a verme.
	AI_Output (self, other, "DIA_Karras_Mission_10_02"); //Me vendría bien un novicio discreto para otro asunto.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Aufgabe		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Aufgabe_Condition;
	information	 = 	DIA_Karras_Aufgabe_Info;
	permanent    =  FALSE;
	description	 = 	"¿Tienes una misión para mí?";
};
func int DIA_Karras_Aufgabe_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Karras_Mission)
	{
		return TRUE;
	};
};
func void DIA_Karras_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_00"); //¿Tienes una misión para mí?
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_01"); //Sí. Tiene que ver con el loco Ignaz. Vive en Khorinis y experimenta con diversos brebajes medicinales y pociones, pero también con hechizos mágicos.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_02"); //Y eso es lo que me preocupa. Me pregunto si su magia le es grata a Innos.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_03"); //Para averiguarlo, necesito algunos de sus pergaminos de hechizos.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_04"); //Quiero que vayas a la ciudad y me consigas tres de sus pergaminos de hechizos.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_05"); //Pero no le digas nada a nadie. ¿Está claro?
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_06"); //Claro.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_07"); //Ten 150 monedas de oro para cubrir gastos.
	
	MIS_KarrasVergessen = LOG_RUNNING;
	
	Log_CreateTopic (Topic_KarrasCharm,LOG_MISSION);
	Log_SetTopicStatus  (Topic_KarrasCharm,LOG_RUNNING);
	B_LogEntry (Topic_KarrasCharm,"El maestro Karras me ha mandado a la ciudad. Quieres que le consiga tres de los pergaminos de conjuro que hace y vende Ignaz.");

	B_GiveInvItems (self, other, ItMi_Gold,150);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Success		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Success_Condition;
	information	 = 	DIA_Karras_Success_Info;
	permanent    =  FALSE;
	description	 = 	"Aquí tienes los pergaminos de hechizos que querías.";
};
func int DIA_Karras_Success_Condition ()
{	
	if (MIS_KarrasVergessen == LOG_RUNNING)
	&& (Npc_HasItems (other, ItSc_Charm) >= 3)
	{
		return TRUE;
	};
};
func void DIA_Karras_Success_Info ()
{
	AI_Output (other, self, "DIA_Karras_Success_15_00"); //Aquí tienes los pergaminos de hechizos que querías.
	AI_Output (self, other, "DIA_Karras_Success_10_01"); //Muy bien, mi joven amigo.
	AI_Output (self, other, "DIA_Karras_Success_10_02"); //No obstante, es hora de que te enfrasques en tus estudios.
	AI_Output (self, other, "DIA_Karras_Success_10_03"); //Y quédate con este pergamino de hechizos a modo de recompensa.
	
	MIS_KarrasVergessen = LOG_SUCCESS;
	B_GivePlayerXP (XP_KarrasCharm);
	B_GiveInvItems (other, self, ItSc_Charm,3);
	B_GiveInvItems (self, other, ItSc_SumWolf,1);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Trade		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Trade_Condition;
	information	 = 	DIA_Karras_Trade_Info;
	permanent    =  TRUE;
	description	 = 	"Enséñame tu mercancía.";
	trade		 =  TRUE; 
};
func int DIA_Karras_Trade_Condition ()
{	
	if (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Karras_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Karras_Trade_15_00"); //Muéstrame tu mercancía.
};
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_JOB		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_JOB_Condition;
	information	 = 	DIA_Karras_JOB_Info;
	permanent    =  FALSE;
	description	 = 	"¿A qué te dedicas?";
};
func int DIA_Karras_JOB_Condition ()
{	
		return TRUE;
};
func void DIA_Karras_JOB_Info ()
{
	AI_Output (other, self, "DIA_Karras_JOB_15_00"); //¿A qué te dedicas?
	AI_Output (self, other, "DIA_Karras_JOB_10_01"); //Me corresponde adiestrar a los magos en el arte de la manifestación esférica.
	AI_Output (other, self, "DIA_Karras_JOB_15_02"); //¿Y eso qué significa?
	AI_Output (self, other, "DIA_Karras_JOB_10_03"); //Bueno, les enseño a convocar criaturas o seres de otros estados o esferas.
	AI_Output (self, other, "DIA_Karras_JOB_10_04"); //A esto se le suele denominar convocación, aunque esta expresión por sí sola no define el arte de invocar a un siervo.
	AI_Output (self, other, "DIA_Karras_JOB_10_05"); //Además, cuento con pergaminos de hechizos interesantes que Gorax no tiene.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Karras_JOB_10_06"); //Pero solo se los proporciono a miembros de la Orden.
	};
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"El maestro Karras, del monasterio, puede proporcionarme pergaminos de conjuros. Pero para ello necesito ser un mago de fuego.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_TEACH		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr 			 =  10;
	condition	 = 	DIA_Karras_TEACH_Condition;
	information	 = 	DIA_Karras_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Enséñame (crear runas).";
};

func int DIA_Karras_TEACH_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Karras_TEACH_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Karras_TEACH_15_00"); //Enséñame.
	
		Info_ClearChoices   (DIA_Karras_TEACH);
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
		&& (PLAYER_TALENT_RUNES [SPL_SummonGoblinSkeleton] == FALSE) 
		{
			Info_AddChoice 		(DIA_Karras_TEACH,B_BuildLearnString (NAME_SPL_SummonGoblinSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton)),DIA_Karras_TEACH_SUMGOBL);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
		&& (PLAYER_TALENT_RUNES [SPL_SummonWolf] == FALSE) 
		{
			Info_AddChoice	    (DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonWolf, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonWolf)) ,DIA_Karras_TEACHSummonWolf);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
		&& (PLAYER_TALENT_RUNES [SPL_SummonSkeleton] == FALSE) 
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonSkeleton)) ,DIA_Karras_TEACH_SummonSkeleton);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4)
		&& (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE) 
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonGolem, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGolem)) ,DIA_Karras_TEACH_SummonGolem);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5)
		&& (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonDemon, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonDemon)) ,DIA_Karras_TEACH_SummonDemon);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 6)
		&& (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)) ,DIA_Karras_TEACH_ArmyOfDarkness);
			abletolearn = (abletolearn +1);
		};
		if 	(abletolearn < 1)
		{
			AI_Output (self, other, "DIA_Karras_TEACH_10_01"); //Por ahora no te puedo enseñar nada.
		}
		else
		{
			Info_AddChoice 		(DIA_Karras_TEACH,DIALOG_BACK,DIA_Karras_TEACH_BACK);
		};

};
FUNC VOID DIA_Karras_TEACH_BACK()
{
	Info_ClearChoices   (DIA_Karras_TEACH);
};
FUNC VOID DIA_Karras_TEACH_SUMGOBL()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGoblinSkeleton);	
};
FUNC VOID DIA_Karras_TEACHSummonWolf()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonWolf);	
};
FUNC VOID DIA_Karras_TEACH_SummonSkeleton()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonSkeleton);	
};
FUNC VOID DIA_Karras_TEACH_SummonGolem()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGolem);	
};
FUNC VOID DIA_Karras_TEACH_SummonDemon()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonDemon);	
};
FUNC VOID DIA_Karras_TEACH_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ArmyOfDarkness);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE4		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	3;
	condition	 = 	DIA_Karras_CIRCLE4_Condition;
	information	 = 	DIA_Karras_CIRCLE4_Info;
	permanent	 = 	TRUE;
	description	 = 	"Quiero aprender el cuarto círculo de magia.";
};
func int DIA_Karras_CIRCLE4_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	{
		return TRUE;
	};
};
func void DIA_Karras_CIRCLE4_Info ()
{
	AI_Output (other, self, "DIA_Karras_CIRCLE4_15_00"); //Quiero aprender el cuarto círculo de magia.
	
	if (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_01"); //Bien. Se han cumplido todas las señales. Entra en el cuarto círculo, para que te inunde el poder de la nueva magia.
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_02"); //Has recorrido un largo camino, e Innos seguirá iluminándolo.
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_03"); //Aún no ha acabado.
	};
};
/////////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE5		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	3;
	condition	 = 	DIA_Karras_CIRCLE5_Condition;
	information	 = 	DIA_Karras_CIRCLE5_Info;
	permanent	 = 	TRUE;
	description	 = 	"Quiero aprender el quinto círculo de magia.";
};
func int DIA_Karras_CIRCLE5_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	{
		return TRUE;
	};
};
func void DIA_Karras_CIRCLE5_Info ()
{
	AI_Output (other, self, "DIA_Karras_CIRCLE5_15_00"); //Quiero aprender el quinto círculo de magia.
	
	if (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_01"); //En ese caso, entra en el quinto círculo de magia. Serás capaz de emplear magia más poderosa que nunca.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_02"); //Hermano, sé prudente al hacer uso de este poder, pues la oscuridad aún es fuerte, igual que tus enemigos.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_03"); //No puedo acompañarte al sexto y último círculo de magia. Pyrokar te ordenará cuando llegue la hora.
			
			B_LogEntry (Topic_KlosterTeacher,"El maestro Pyrokar me ha ordenado en el sexto círculo de magia.");
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_04"); //Aún no ha llegado el momento.
	};
};
//#####################################################################
//##
//##		Kapitel 2
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP2_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP2_EXIT_Condition;
	information = DIA_Karras_KAP2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##		Kapitel 3
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP3_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP3_EXIT_Condition;
	information = DIA_Karras_KAP3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_ChasePedro		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	31;
	condition	 = 	DIA_Karras_ChasePedro_Condition;
	information	 = 	DIA_Karras_ChasePedro_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};

func int DIA_Karras_ChasePedro_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (KAPITEL == 3)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Karras_ChasePedro_Info ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_00"); //Hermano, no pierdas tiempo. Debes localizar a Pedro y devolver el Ojo de Innos al monasterio.
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_01"); //Si no recuperamos el Ojo, todo estará perdido.
	}
	else
	{
		AI_Output	(self ,other, "DIA_Karras_ChasePedro_10_02"); //¿Qué haces aquí? ¿No deberías estar buscando al traidor Pedro?
	
		Info_ClearChoices (DIA_Karras_ChasePedro);
		Info_AddChoice (DIA_Karras_ChasePedro,"Más tarde. Antes tengo que ocuparme de algo.",DIA_Karras_ChasePedro_Later);
		Info_AddChoice (DIA_Karras_ChasePedro,"No va a llegar muy lejos.",DIA_Karras_ChasePedro_WontEscape);
	};

};	

func void DIA_Karras_ChasePedro_Later ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_Later_15_00"); //Más tarde. Antes tengo que ocuparme de algo.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_01"); //¿Tienes idea de lo que significa esta pérdida para el monasterio? El Ojo de Innos es un arma poderosa.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_02"); //Nadie puede prever lo que el enemigo pretende hacer con el amuleto, pero planea algo y tenemos que impedirlo.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_03"); //¡Ponte manos a la obra de inmediato y localiza al ladrón!

	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Karras_ChasePedro_WontEscape ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_00"); //No va a llegar muy lejos.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_01"); //Por tu bien, espero que sea así. Si huyera por culpa de tu holgazanería, te llevaré personalmente ante el tribunal.
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_02"); //¿De qué me acusarías?
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_03"); //De conspiración con el enemigo. No hace falta mucha imaginación para figurarse el castigo de dicho delito.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_04"); //Procura no perder más tiempo si no quieres que la próxima vez que nos veamos sea en la hoguera.

	AI_StopProcessInfos (self);
};
	
///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_NeedInfo		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	31;
	condition	 = 	DIA_Karras_NeedInfo_Condition;
	information	 = 	DIA_Karras_NeedInfo_Info;
	permanent	 = 	TRUE;
	important	 =	TRUE;
};

func int DIA_Karras_NeedInfo_Condition ()
{	
	if (Npc_KnowsInfo  (other ,DIA_Karras_ChasePedro))
	&& (KAPITEL == 3)
	&& (hero.Guild != GIL_KDF)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	&& (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Karras_NeedInfo_Info ()
{
	
	AI_Output (self ,other,"DIA_Karras_NeedInfo_10_00"); //Ya sabes todo lo que tienes que saber. ¡Ponte en marcha!
	
	AI_StopProcessInfos (self);
};

//********************************************************************
//		Auge gefunden
//********************************************************************

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_InnosEyeRetrieved		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	1;	//damit auch ganz sicher diese Info kommt (wg hello)!!!!
	condition	 = 	DIA_Karras_InnosEyeRetrieved_Condition;
	information	 = 	DIA_Karras_InnosEyeRetrieved_Info;
	permanent	 = 	FALSE;
	description	 =	"He recuperado el Ojo de Innos.";
};

func int DIA_Karras_InnosEyeRetrieved_Condition ()
{	
	if	(KAPITEL == 3)
	&& 	(MIS_NOVIZENCHASE == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Karras_InnosEyeRetrieved_Info ()
{
	
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_00"); //He recuperado el Ojo de Innos.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_01"); //Me tranquiliza que hayas logrado arrebatar el Ojo al enemigo.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_02"); //Pero no se ha conjurado el peligro. El mal sigue adelante con sus planes y actúa con una agresividad desacostumbrada.
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_03"); //Ya me he dado cuenta.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_04"); //No te burles. La situación es grave, muy grave, y no sabemos en quién confiar.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_05"); //El enemigo ya ha conseguido que Pedro caiga en la tentación, y puede tener éxito con muchos otros.

	B_GivePlayerXP (XP_AMBIENT);
};
	
///////////////////////////////////////////////////////////////////////
//	KAP3_Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP3_Perm   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 5;
	condition   = DIA_Karras_KAP3_Perm_Condition;
	information = DIA_Karras_KAP3_Perm_Info;
	permanent   = TRUE;
	description = "¿Cómo van los estudios?";
};
FUNC INT DIA_Karras_KAP3_Perm_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB))
		{
			return TRUE;
		};	
};
FUNC VOID DIA_Karras_KAP3_Perm_Info()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_00"); //¿Cómo van los estudios?

	if (MIS_KarrasResearchDMT == FALSE)
	&& (PyrokarToldKarrasToResearchDMT == TRUE)
	&& (hero.guild == GIL_KDF)
	{
		
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_01"); //He logrado averiguar algo acerca de los buscadores.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_02"); //¿Y de qué se trata?
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_03"); //Es evidente que tienen un origen demoníaco. Como mínimo están, o estaban, influidos por demonios.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_04"); //Ten cuidado si te topas con ellos.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_05"); //Menuda novedad.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_06"); //Lo siento, pero no tengo bastante material para hacer una afirmación más concreta.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_07"); //Pero si consigues traerme algo suyo para que lo examine...
		
		MIS_KarrasResearchDMT = LOG_RUNNING;
		B_LogEntry (TOPIC_DEMENTOREN,"Karras necesita algo que haya estado en contacto directo con los buscadores, así podrá continuar sus investigaciones."); 

		Info_ClearChoices (DIA_Karras_KAP3_Perm);
		Info_AddChoice (DIA_Karras_KAP3_Perm,DIALOG_BACK,DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Veré lo que puedo hacer.",DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"¿Podría estar implicado el Durmiente?",DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"¿Qué clase de material necesitas?",DIA_Karras_KAP3_Perm_Material);
	}
	else if MIS_KarrasResearchDMT == LOG_RUNNING 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_08"); //Sigo trabajando en la interpretación de las evidencias relacionadas con los buscadores.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_09"); //Por supuesto, en cuanto sepa algo te informaré de inmediato.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_10"); //El enemigo tiene muchos rostros, y es dificilísimo calcular cuál es más peligroso para el monasterio.
	};
};


FUNC VOID DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

FUNC VOID DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Sleeper_15_00"); //¿Podría estar implicado el Durmiente?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01"); //He oído la historia del Durmiente, pero desde lejos no puedo decir nada al respecto.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02"); //Hay innumerables demonios, y cualquiera podría estar implicado.
};

FUNC VOID DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Corpse_15_00"); //Entonces, ¿quieres que te traiga un cadáver?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_01"); //No, ¿estás loco? Los peligros que plantearía un ser demoníaco en el interior del monasterio son excesivos.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_02"); //Bastará con que encuentres objetos que sean típicos de estos seres.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_03"); //Los restos del aura demoníaca que se aferra a ellos debería ofrecer suficientes indicios para un examen.
};

FUNC VOID DIA_Karras_KAP3_Perm_Material()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Material_15_00"); //¿Qué clase de material necesitas?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Material_10_01"); //¿Y yo qué sé? Cualquier objeto que pertenezca a estos seres.
	
	Info_AddChoice (DIA_Karras_KAP3_Perm,"¿Quieres que te traiga un cadáver?",DIA_Karras_KAP3_Perm_Corpse);
};

FUNC VOID DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_WillSee_15_00"); //Veré lo que puedo hacer.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_WillSee_10_01"); //Sería muy útil. Mientras tanto, me dedicaré a investigar.
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

//********************************************************************
//	Ich habe hier dieses Buch.
//********************************************************************

INSTANCE DIA_Karras_HaveBook   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_HaveBook_Condition;
	information = DIA_Karras_HaveBook_Info;
	permanent   = FALSE;
	description = "Aquí tengo un Almanáque del poseído.";
};
FUNC INT DIA_Karras_HaveBook_Condition()
{
	if (MIS_KarrasResearchDMT == LOG_RUNNING)
	&& (Npc_HasItems (hero, ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
var int KarrasGotResearchDMTBook_Day;
FUNC VOID DIA_Karras_HaveBook_Info()
{
	AI_Output (other,self ,"DIA_Karras_HaveBook_15_00"); //Aquí tengo un almanaque de los poseídos. A lo mejor te sirve de algo.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_01"); //Enséñamelo.
	
	Npc_RemoveInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
    AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
		
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_02"); //Sí, puede valer. Examinaré el libro.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_03"); //Pero ya estoy seguro de una cosa.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_04"); //En mi opinión, los buscadores son una forma de vida absolutamente perversa, creada por Beliar.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_05"); //Estos seres tienen un origen mitad demoníaco y mitad humano.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_06"); //Sin embargo, todavía no sé si se trata de una especie de posesión espiritual o una mutación puramente física.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_07"); //Vuelve luego. Para entonces, seguramente sepa más cosas.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras ha podido usar el almanáque de los poseídos para continuar la investigación. Volveré con él más tarde."); 
	KarrasGotResearchDMTBook_Day = Wld_GetDay(); 
	B_GivePlayerXP (XP_KarrasResearchDMT);
};

//********************************************************************
//	ResearchDMTEnd
//********************************************************************

INSTANCE DIA_Karras_ResearchDMTEnd   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_ResearchDMTEnd_Condition;
	information = DIA_Karras_ResearchDMTEnd_Info;
	permanent   = TRUE;

	description = "¿Has averiguado algo nuevo de los buscadores?";
};
FUNC INT DIA_Karras_ResearchDMTEnd_Condition()
{
	if (MIS_KarrasResearchDMT == LOG_SUCCESS)
	&& (hero.guild == GIL_KDF)
	&& (SC_KnowsMadPsi == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Karras_ResearchDMTEnd_Info()
{
	AI_Output (other,self ,"DIA_Karras_ResearchDMTEnd_15_00"); //¿Has averiguado algo nuevo de los buscadores?

	if (KarrasGotResearchDMTBook_Day <= (Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_01"); //Sí. Ya sé quiénes o qué son los buscadores.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_02"); //¡Suéltalo!
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_03"); //En tiempos fueron humanos, como tú o yo, pero cometieron el terrible error de consagrarse a la magia impura de un archidemonio muy poderoso.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_04"); //Bajo la influencia de este archidemonio y de drogas muy potentes, existían únicamente para servirlo hasta que acaban siendo reducidos a meras sombras de sí mismos.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_05"); //En la actualidad, no son más que instrumentos del mal, sin voluntad propia, y no dejarán de perseguir a los discípulos de Innos.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_06"); //Hemos de tener cuidado. Parece que todavía eluden las salas consagradas de Innos.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_07"); //Sin embargo, si su poder sigue creciendo, no sé si seguiremos estando a salvo aquí.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_08"); //Gracias. Ha sido muy esclarecedor.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_09"); //¿Ah, sí? A mí me plantea más preguntas. Por ejemplo, ¿antes quiénes eran, y qué archidemonio les convirtió en lo que son ahora?
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_10"); //He tenido una idea. Esto suena a la Fraternidad del Durmiente. Conozco a esos tipos.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_11"); //Espero que sepas en lo que te metes. Cuídate, hermano mío.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_12"); //Por supuesto. Aquí tienes el almanaque. Ya no lo necesito.

		CreateInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
		AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

		SC_KnowsMadPsi = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Los estudios de Karras han dado sus frutos. Parece que hay una especie de vínculo entre los buscadores y la hermandad del Durmiente."); 
		B_GivePlayerXP (XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_13"); //Estoy en ello. Vuelve luego.
	};
};

//********************************************************************
//	Prot_BlackEye	(ItAm_Prot_BlackEye_Mis)
//********************************************************************

INSTANCE DIA_Karras_Prot_BlackEye   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_Prot_BlackEye_Condition;
	information = DIA_Karras_Prot_BlackEye_Info;
	permanent   = TRUE;

	description = "¿Hay alguna manera de protegerse de los ataques mentales de los buscadores?";
};
FUNC INT DIA_Karras_Prot_BlackEye_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Pyrokar_AskKarrasAboutDMTAmulett == TRUE)
	&& (MIS_Karras_FindBlessedStone == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_Prot_BlackEye_Info()
{
	AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_00"); //¿Hay alguna manera de protegerse de los ataques mentales de los buscadores?

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_01"); //Sí. Un amuleto de piedra extraída de suelo bendito podría tener un efecto protector.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_02"); //Por desgracia, no me quedan suficientes piedras.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_03"); //Algunos de los altares que hemos erigido están hechos de ellas.
		AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_04"); //Muy bien. Me agenciaré unas cuantas.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_05"); //Sí, hazlo. Pero ni se te ocurra dañar los altares, ¿me oyes?
		B_LogEntry (TOPIC_DEMENTOREN,"Karras puede proporcionarme algo de protección contra los ataques mentales de los buscadores. Necesita piedra de suelo sagrado. Algunos altares están hechos de piedras de ese tipo."); 
		MIS_Karras_FindBlessedStone = LOG_RUNNING;
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_06"); //Ni idea. Todavía no tengo datos para responderte. Pregúntame luego.
	};
};

//********************************************************************
//	KarrasBlessedStone	(ItAm_Prot_BlackEye_Mis)
//********************************************************************

INSTANCE DIA_Karras_KarrasBlessedStone   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_KarrasBlessedStone_Condition;
	information = DIA_Karras_KarrasBlessedStone_Info;

	description = "He conseguido piedra extraída de suelo bendito.";
};
FUNC INT DIA_Karras_KarrasBlessedStone_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_HasItems (other,ItMi_KarrasBlessedStone_Mis))
	&& (MIS_Karras_FindBlessedStone == LOG_RUNNING)
	{
		return TRUE;
	};	
};
var int KarrasMakesBlessedStone_Day;
FUNC VOID DIA_Karras_KarrasBlessedStone_Info()
{
	AI_Output (other,self ,"DIA_Karras_KarrasBlessedStone_15_00"); //He conseguido piedra extraída de suelo bendito.
	B_GiveInvItems (other, self, ItMi_KarrasBlessedStone_Mis,1);
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_01"); //Bien. Espero que todos los altares sigan en su sitio.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_02"); //Muy bien. Te haré un amuleto que te proteja de la mirada negra de los buscadores.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_03"); //Dame algo de tiempo. Ahora mismo me pongo manos a la obra.
	KarrasMakesBlessedStone_Day = Wld_GetDay(); 
	MIS_Karras_FindBlessedStone	= LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras va a darme un amuleto protector contra los ataques mentales de los buscadores. Eso lo simplifica todo."); 
	B_GivePlayerXP (XP_Karras_FoundBlessedStone);
	AI_StopProcessInfos (self);
};

//********************************************************************
//	ItAm_Prot_BlackEye_Mis
//********************************************************************

INSTANCE DIA_Karras_ItAm_Prot_BlackEye_Mis   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition;
	information = DIA_Karras_ItAm_Prot_BlackEye_Mis_Info;
	permanent	 = 	TRUE;

	description = "¿Qué hay del amuleto protector que me prometiste?";
};
var int DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm;
FUNC INT DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Karras_FindBlessedStone == LOG_SUCCESS)
	&& (DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Karras_ItAm_Prot_BlackEye_Mis_Info()
{
	AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00"); //¿Qué hay del amuleto protector que me prometiste?
	
	if (KarrasMakesBlessedStone_Day<=(Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01"); //Ya he acabado. Ten, echa un vistazo. Tiene un aspecto magnífico.
		CreateInvItems (self, ItAm_Prot_BlackEye_Mis, 1);									
		B_GiveInvItems (self, other, ItAm_Prot_BlackEye_Mis, 1);					
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02"); //Si lo llevas encima en todo momento, los buscadores no podrán arrastrarte a su abismo mental.
		AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03"); //Gracias.
		B_LogEntry (TOPIC_DEMENTOREN,"Karras me ha dado un amuleto de protección contra la mirada oscura de los buscadores."); 
		DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm = TRUE;
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04"); //Paciencia. Sigo en ello.
	};
};

//#####################################################################
//##
//##		Kapitel 4
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Kap4 Exit	
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP4_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP4_EXIT_Condition;
	information = DIA_Karras_KAP4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


//#####################################################################
//##
//##		Kapitel 5
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP5_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP5_EXIT_Condition;
	information = DIA_Karras_KAP5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Karras_PICKPOCKET (C_INFO)
{
	npc			= KDF_503_Karras;
	nr			= 900;
	condition	= DIA_Karras_PICKPOCKET_Condition;
	information	= DIA_Karras_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Karras_PICKPOCKET_Condition()
{
	C_Beklauen (49, 35);
};
 
FUNC VOID DIA_Karras_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Karras_PICKPOCKET);
	Info_AddChoice		(DIA_Karras_PICKPOCKET, DIALOG_BACK 		,DIA_Karras_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Karras_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Karras_PICKPOCKET_DoIt);
};

func void DIA_Karras_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Karras_PICKPOCKET);
};
	
func void DIA_Karras_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Karras_PICKPOCKET);
};


