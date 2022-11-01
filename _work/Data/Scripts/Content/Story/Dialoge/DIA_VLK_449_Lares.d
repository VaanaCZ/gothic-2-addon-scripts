// ************************************************************
// 			Lares Patch 
// ************************************************************
instance DIA_Addon_Lares_Patch		(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 99;
	condition	= DIA_Addon_Lares_Patch_Condition;
	information	= DIA_Addon_Lares_Patch_Info;
	description	= "(Ornament - Stück zurückverlangen)";
};
func int DIA_Addon_Lares_Patch_Condition ()
{
	if (Npc_HasItems  (self,ItMi_Ornament_Addon_Vatras))
	&& (Kapitel >= 3)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Patch_Info ()
{
	B_GiveInvItems (self, other, ItMi_Ornament_Addon_Vatras,1);
};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap1_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap1_EXIT_Condition;
	information	= DIA_Lares_Kap1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HaltsMaul
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_HaltsMaul		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_HaltsMaul_Condition;
	information	 = 	DIA_Addon_Lares_HaltsMaul_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Lares_HaltsMaul_Condition ()
{
	if (Lares_HaltsMaul == TRUE)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Addon_Lares_HaltsMaul_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_HaltsMaul_09_01"); //Te veré luego, en el puerto.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lares_PICKPOCKET (C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 900;
	condition	= DIA_Lares_PICKPOCKET_Condition;
	information	= DIA_Lares_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Lares_PICKPOCKET_Condition()
{
	C_Beklauen (95, 350);
};
 
FUNC VOID DIA_Lares_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lares_PICKPOCKET);
	Info_AddChoice		(DIA_Lares_PICKPOCKET, DIALOG_BACK 			,DIA_Lares_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lares_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lares_PICKPOCKET_DoIt);
};

func void DIA_Lares_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lares_PICKPOCKET);
};
	
func void DIA_Lares_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lares_PICKPOCKET);
};
// ************************************************************
// 			  				   Hallo 
// ************************************************************
instance DIA_Lares_HALLO		(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Lares_HALLO_Condition;
	information	= DIA_Lares_HALLO_Info;
	permanent 	= FALSE;
	important 	= TRUE; 
};
func int DIA_Lares_HALLO_Condition ()
{	
	if 	(RangerMeetingRunning == 0)//ADDON
		{
			return TRUE;
		};
};
func void DIA_Lares_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Lares_HALLO_09_00"); //Debo estar loco. ¿Qué estás haciendo aquí?
	
	if (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		AI_Output (self, other, "DIA_Lares_HALLO_09_01"); //¿Viniste NADANDO hasta aquí?
		AI_Output (self, other, "DIA_Lares_HALLO_09_02"); //(Se ríe) Ésa es una forma de sortear a los guardias de la puerta de la ciudad.
		B_GivePlayerXP (500); //wer's schafft...	
	};
			
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"¿Nos conocemos?",DIA_Lares_HALLO_NO);
	Info_AddChoice 		(DIA_Lares_HALLO,"Ey, Lares, vieja sabandija...",DIA_Lares_HALLO_YES);
};
FUNC VOID DIA_Lares_HALLO_NO()
{
	AI_Output (other, self, "DIA_Lares_HALLO_NO_15_00"); //¿Nos conocemos?
	AI_Output (self, other, "DIA_Lares_HALLO_NO_09_01"); //Tío, ¿no me recuerdas? Solía andar por el campamento nuevo.
	AI_Output (self, other, "DIA_Lares_HALLO_NO_09_02"); //La lista para la mina... Tío, qué bien nos lo pasamos. ¿Te acuerdas de Lee?
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"¡Claro que recuerdo a Lee!",DIA_Lares_HALLO_LEE);
	Info_AddChoice 		(DIA_Lares_HALLO,"¿Lee...?",DIA_Lares_HALLO_NOIDEA);
};
FUNC VOID DIA_Lares_HALLO_YES()
{
	AI_Output (other, self, "DIA_Lares_HALLO_YES_15_00"); //Ey, Lares, viejo canalla, ¿cómo llegaste aquí?
	AI_Output (self, other, "DIA_Lares_HALLO_YES_09_01"); //Pude escapar del Valle de las Minas justo a tiempo, junto a Lee y algunos de los demás.
	AI_Output (self, other, "DIA_Lares_HALLO_YES_09_02"); //¿Te acuerdas de Lee, no?
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
	
	Info_AddChoice 		(DIA_Lares_HALLO,"¡Claro que recuerdo a Lee!",DIA_Lares_HALLO_LEE);
	Info_AddChoice 		(DIA_Lares_HALLO,"¿Lee...?",DIA_Lares_HALLO_NOIDEA);
};

// ------------------------------	
	func void B_Lares_AboutLee()
	{
		AI_Output (self, other, "B_Lares_AboutLee_09_00"); //Salí de la colonia con él. Justo después de que la barrera fuera destruida.
		AI_Output (self, other, "B_Lares_AboutLee_09_01"); //Sus chicos y él están ahora en la granja de Onar el terrateniente.
		AI_Output (self, other, "B_Lares_AboutLee_09_02"); //Hizo un pacto con el granjero. Sus chicos y él defenderían la granja y Onar, a cambio, los alimentaría.
	};
// ------------------------------	

FUNC VOID DIA_Lares_HALLO_LEE()
{
	AI_Output (other, self, "DIA_Lares_HALLO_LEE_15_00"); //¡Claro que recuerdo a Lee!
	B_Lares_AboutLee();
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
};
FUNC VOID DIA_Lares_HALLO_NOIDEA()
{
	AI_Output (other, self, "DIA_Lares_HALLO_NOIDEA_15_00"); //¿Lee...?
	AI_Output (self, other, "DIA_Lares_HALLO_NOIDEA_09_01"); //¿Has pasado por un montón de cosas, eh? Lee era el líder de los mercenarios en el campamento nuevo.
	B_Lares_AboutLee();
	
	Info_ClearChoices 	(DIA_Lares_HALLO);
};



// ************************************************************
// ***														***
// 								ADDON
// ***														***
// ************************************************************

// ------------------------------------------------------------
// Vatras schickt mich 
// ------------------------------------------------------------
instance DIA_Addon_Lares_Vatras		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 1;
	condition	= DIA_Addon_Lares_Vatras_Condition;
	information	= DIA_Addon_Lares_Vatras_Info;

	description	= "Me envía Vatras.";
};
func int DIA_Addon_Lares_Vatras_Condition ()
{
	if (Vatras_GehZuLares == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Vatras_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_Vatras_15_00"); //Me envía Vatras. Me dijo que acudiera a ti cuando necesitara ayuda.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_01"); //(sorprendido) Así que ya has ido a ver a Vatras. Debes de haberle dejado huella.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_02"); //Si no, seguro que no te hubiera revelado mi nombre. Sobre todo ahora, con ese asunto de la gente desaparecida aún sin resolver.
	AI_Output	(self, other, "DIA_Addon_Lares_Vatras_09_03"); //Dime qué necesitas.
	Lares_RangerHelp = TRUE;

	if (GregLocation == Greg_Farm1)
	{
		B_StartOtherRoutine	(Bau_974_Bauer,"GregInTaverne");
		GregLocation = Greg_Taverne;
		B_StartOtherRoutine	(Greg_NW,"Taverne");
	};
};

// ************************************************************
// 						Ring des Wassers
// ************************************************************
// ------------------------------------------------------------
// WhatAreYouGuys
// ------------------------------------------------------------
instance DIA_Addon_Lares_WhatAreYouGuys		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 6;
	condition	= DIA_Addon_Lares_WhatAreYouGuys_Condition;
	information	= DIA_Addon_Lares_WhatAreYouGuys_Info;

	description	 = 	"¿Qué tienes tú que ver con Vatras?";
};
func int DIA_Addon_Lares_WhatAreYouGuys_Condition ()
{
	if (Lares_RangerHelp == TRUE)
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_WhatAreYouGuys_Info ()
{	
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_00"); //¿Qué tienes tú que ver con Vatras?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_01"); //Tengo un pequeño acuerdo con los Magos de Agua, ¿sabes?
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_02"); //¿Qué tipo de acuerdo?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_03"); //Trabajamos para ellos y ellos se ocupan de que nuestro pasado en la colonia penal no nos acarree problemas.
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_04"); //¿Hablas del 'Anillo de Agua'?
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_05"); //¿Has oído hablar de él?
	AI_Output (other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_06"); //Vatras me lo contó.
	AI_Output (self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_07"); //Deberías haberlo dicho antes.

	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Lares pertenece al 'Anillo de Agua'." ); 
};
// ------------------------------------------------------------
// Ranger
// ------------------------------------------------------------
instance DIA_Addon_Lares_Ranger		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 5;
	condition	= DIA_Addon_Lares_Ranger_Condition;
	information	= DIA_Addon_Lares_Ranger_Info;

	description	= "Háblame más del 'Anillo de Agua'.";
};
func int DIA_Addon_Lares_Ranger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lares_WhatAreYouGuys))
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Ranger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_Ranger_15_00"); //Háblame más del 'Anillo de Agua'.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_01"); //El 'Anillo' es para los Magos de Agua lo que los paladines para los Magos de Fuego.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_02"); //Pero, a diferencia de los paladines, nosotros trabajamos en la sombra.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_03"); //El 'Anillo' es una poderosa arma para combatir los peligros que amenazan a la población de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_04"); //Pero sólo funciona mientras mantengamos en secreto la identidad de los que pertenecen al 'Anillo de Agua'.
	AI_Output	(self, other, "DIA_Addon_Lares_Ranger_09_05"); //¡Así que no abras la boca!
	AI_Output	(other, self, "DIA_Addon_Lares_Ranger_15_06"); //Claro.
	B_LogEntry (TOPIC_Addon_RingOfWater,"El 'Anillo' es para los Magos de Agua lo que los paladines son para los Magos de Fuego, pero el 'Anillo' opera en la sombra. Nadie debe saber QUIÉN es miembro, para que su fuerza sea un secreto." ); 
};
// ------------------------------------------------------------
// Info WannaBeRanger
// ------------------------------------------------------------
instance DIA_Addon_Lares_WannaBeRanger		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_WannaBeRanger_Condition;
	information	= DIA_Addon_Lares_WannaBeRanger_Info;

	description	= "Quiero unirme al 'Anillo de Agua'…";
};
func int DIA_Addon_Lares_WannaBeRanger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lares_Ranger))
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_WannaBeRanger_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_15_00"); //Quiero unirme al 'Anillo de Agua'
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_09_01"); //Por mí de acuerdo. Pero la decisión de si te aceptan o no depende sólo de los Magos de Agua.
	
	B_LogEntry (TOPIC_Addon_RingOfWater, LogText_Addon_KDWRight); 


	Info_ClearChoices	(DIA_Addon_Lares_WannaBeRanger);
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "Ya veo.", DIA_Addon_Lares_WannaBeRanger_BACK );
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "¿Cómo es pertenecer al 'Anillo de Agua'?", DIA_Addon_Lares_WannaBeRanger_HowIsIt );
	Info_AddChoice	(DIA_Addon_Lares_WannaBeRanger, "¿Qué hiciste para impresionar a los Magos de Agua?", DIA_Addon_Lares_WannaBeRanger_AboutYou );
};
func void DIA_Addon_Lares_WannaBeRanger_BACK ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_BACK_15_00"); //Comprendo.
	Info_ClearChoices	(DIA_Addon_Lares_WannaBeRanger);
};
func void DIA_Addon_Lares_WannaBeRanger_AboutYou ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_AboutYou_15_00"); //¿Qué hiciste para impresionar a los Magos de Agua?
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01"); //Los protegí durante un tiempo cuando aún vivíamos con la Barrera.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02"); //(sonríe) Y tienen muchísimo que agradecerme.
};
func void DIA_Addon_Lares_WannaBeRanger_HowIsIt ()
{
	AI_Output (other, self, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00"); //¿Cómo es pertenecer al 'Anillo de Agua'?
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01"); //Somos muy distintos al resto de comunidades normales de Khorinis.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02"); //Siendo uno de los nuestros, no vamos a pedirte nada que no estés dispuesto a hacer.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03"); //Lo único importante de verdad es que no abras la boca.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04"); //Trabajamos en secreto y no queremos que los de fuera sepan quiénes somos miembros.
	AI_Output (self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05"); //Te mantendremos vigilado. El resto, ya veremos.
};
// ------------------------------------------------------------
// Info RingBack (Bin jetzt dabei)
// ------------------------------------------------------------
func void B_Lares_Geheimtreffen()
{
	AI_Output (self, other, "DIA_Addon_Lares_RingBack_09_07"); //Pronto celebraremos una reunión secreta en la taberna de Orlan.
	AI_Output (self, other, "DIA_Addon_Lares_RingBack_09_08"); //Reúnete allí con nosotros en cuanto puedas. Allí te daremos tus cosas.
};
// ------------------------------------------------------------
instance DIA_Addon_Lares_RingBack		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_RingBack_Condition;
	information	 = 	DIA_Addon_Lares_RingBack_Info;

	description	 = 	"Ahora pertenezco al 'Anillo de Agua'.";
};
func int DIA_Addon_Lares_RingBack_Condition ()
{
	if (SC_IsRanger == TRUE)
	&& (MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS)
	&& (((Npc_GetDistToWP(self,"NW_CITY_HABOUR_02_B")<1000) )||((Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08")<1000)))
		{
			return TRUE;
		};
};
func void DIA_Addon_Lares_RingBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_00"); //Ahora pertenezco al 'Anillo de Agua'.
	
	if (Lares_GotRingBack == FALSE) 
	&& (SC_GotLaresRing == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_01"); //Genial. ¿Entonces me devuelves mi anillo de aguamarina?
		
		if (B_GiveInvItems (other, self, ItRi_Ranger_Lares_Addon,1))
		{
			AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_02"); //Claro. Tómalo.
			AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_03"); //Espero que te haya sido útil. Me alegra saber que eres de los nuestros.
			Lares_GotRingBack = TRUE;
			B_GivePlayerXP (XP_Ambient);
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Lares_RingBack_15_04"); //Hmm. Ahora no lo llevo encima.
			AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_05"); //¡No juegues conmigo! Lo necesito.
		};
	};

	AI_Output	(self, other, "DIA_Addon_Lares_RingBack_09_06"); //Supongo que querrás tus cosas ahora, así que presta atención.
	B_Lares_Geheimtreffen();
	
	B_LogEntry (TOPIC_Addon_RingOfWater, "Lares me ha invitado a ir a la reunión secreta del 'Anillo' en la taberna de Orlan."); 
	
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_RUNNING;
};
// ------------------------------------------------------------
// Info RingBack2
// ------------------------------------------------------------
instance DIA_Addon_Lares_RingBack2		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 5;
	condition	= DIA_Addon_Lares_RingBack2_Condition;
	information	= DIA_Addon_Lares_RingBack2_Info;

	description	= "Toma tu anillo de aguamarina";
};
func int DIA_Addon_Lares_RingBack2_Condition ()
{
	if (Npc_HasItems (other,ItRi_Ranger_Lares_Addon))
	&& (Lares_GotRingBack == FALSE)
	&& (MIS_Addon_Lares_ComeToRangerMeeting != 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_RingBack2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_RingBack2_15_00"); //Toma tu anillo de aguamarina
	B_GiveInvItems (other, self, ItRi_Ranger_Lares_Addon,1);
	AI_Output	(self, other, "DIA_Addon_Lares_RingBack2_09_01"); //Menos mal. Pensaba que lo habías perdido.
	B_GivePlayerXP (XP_Ambient);
	Lares_GotRingBack = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Geduld
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_Geduld		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 =  2;
	condition	 = 	DIA_Addon_Lares_Geduld_Condition;
	information	 = 	DIA_Addon_Lares_Geduld_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Lares_Geduld_Condition ()
{
	if (RangerMeetingRunning == LOG_RUNNING)
	&& (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES")>200)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_Geduld_Info ()
{ 
	AI_Output	(self, other, "DIA_Addon_Lares_Geduld_09_01"); //Tienes que esperar un poco más. Aún no han llegado todos.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 						RANGER MEETING
// ************************************************************
instance DIA_Addon_Lares_GetRangerArmor		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 5;
	condition	= DIA_Addon_Lares_GetRangerArmor_Condition;
	information	= DIA_Addon_Lares_GetRangerArmor_Info;
	important	= TRUE;
};
func int DIA_Addon_Lares_GetRangerArmor_Condition ()
{
	if (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING)
	&& ((Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES")<200))
	&& (RangerMeetingRunning == LOG_RUNNING)
	&& (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_GetRangerArmor_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_00"); //Muy bien, mi joven amigo. Nos hemos reunido aquí para celebrar tu admisión en el 'Anillo de Agua'.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_01"); //Todos los presentes aquí te mantendrán vigilado de ahora en adelante.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_02"); //Por supuesto, hay más gente que pertenece al 'Anillo de Agua', así que cuidado.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_03"); //Ya nos prestes un servicio o te metas en líos, nos vamos a enterar.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_04"); //Toma, la armadura de nuestra comunidad.
	CreateInvItem	(hero, ITAR_RANGER_Addon);
	AI_EquipArmor	(hero, ITAR_RANGER_Addon);	
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_05"); //Llévala con orgullo, pero nunca en la ciudad ni en otras zonas habitadas.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_06"); //Recuerda, no debemos correr riesgos. Nadie debe enterarse de quién pertenece al 'Anillo de Agua'.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_07"); //No hablar del 'Anillo de Agua'. Esa es nuestra regla número uno. No la rompas.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_09_08"); //¿Alguna pregunta?
	
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "Me tengo que ir.", DIA_Addon_Lares_GetRangerArmor_end );
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "¿Qué clase de ayuda me podéis proporcionar?", DIA_Addon_Lares_GetRangerArmor_Learn );
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, "¿Y qué hay de las armas?", DIA_Addon_Lares_GetRangerArmor_weapons );

};
func void DIA_Addon_Lares_GetRangerArmor_weapons ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_weapons_15_00"); //¿Y qué hay de las armas?
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_weapons_09_01"); //El arma del 'Anillo' es la barra, pero cada uno utiliza el arma con la que se siente más a gusto.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_weapons_09_02"); //Este es uno de nuestros bastones. Nunca he sabido muy bien cómo se usa, pero quizás tú puedas manejarlo.
	CreateInvItems (self, ItMw_RangerStaff_Addon, 1);									
	B_GiveInvItems (self, other, ItMw_RangerStaff_Addon, 1);		
};
func void DIA_Addon_Lares_GetRangerArmor_end ()
{
	B_MakeRangerReadyToLeaveMeetingALL ();
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_end_15_00"); //Me tengo que ir.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_01"); //Bien, entonces no te entretendremos.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_02"); //Ve directamente a ver a Vatras para que te asigne tu primera misión.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_03"); //Hermanos del 'Anillo', volvamos ahora a nuestros quehaceres.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_04"); //Aún se producen ataques de bandidos. Debemos erradicar esa amenaza.
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_05"); //Adanos, preserva el equilibrio del mundo.
	Lares_TakeFirstMissionFromVatras = TRUE;

	Info_ClearChoices	(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice	(DIA_Addon_Lares_GetRangerArmor, DIALOG_ENDE, DIA_Addon_Lares_GetRangerArmor_weiter );
};
func void DIA_Addon_Lares_GetRangerArmor_weiter () 
{
	AI_StopProcessInfos (self);
	B_RangerMeetingParking ();
	B_LogEntry (TOPIC_Addon_RingOfWater,"Me dieron mi armadura durante la reunión secreta en la taberna de Orlan. Ahora tengo que ir a ver a Vatras que me dará mi primera misión como miembro del 'Anillo'." ); 
};

func void DIA_Addon_Lares_GetRangerArmor_Learn ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GetRangerArmor_Learn_15_00"); //¿Qué clase de ayuda me podéis proporcionar?
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_01"); //Te puedo enseñar a ser más diestro.

	if ((Npc_IsDead(SLD_805_Cord))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_02"); //Si necesitas ayuda con las armas cuerpo a cuerpo, habla con Cord. Es un maestro con la espada.
	};
	if ((Npc_IsDead(BAU_961_Gaan))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_03"); //Gaan te enseñará gustoso a destripar animales como es debido.
	};	
	if ((Npc_IsDead(Mil_350_Addon_Martin))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_04"); //Martin puede contarte muchas cosas de los paladines.
	};	
	if ((Npc_IsDead(Bau_4300_Addon_Cavalorn))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_05"); //Cavalorn te enseñará técnicas de sigilo, combate a una mano y tiro con arco.
	};
	if ((Npc_IsDead(BAU_970_Orlan))== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_06"); //Orlan siempre dispondrá para ti de una acogedora habitación y una cama.
	};
	AI_Output	(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_07"); //Y para cualquier cosa relacionada con la magia, acude a Vatras.
};



// ************************************************************
// 							Teleporter
// ************************************************************
instance DIA_Addon_Lares_Teleportstation		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_Teleportstation_Condition;
	information	 = 	DIA_Addon_Lares_Teleportstation_Info;

	description	 = 	"¿Has usado alguna vez una piedra de teletransporte?";
};
func int DIA_Addon_Lares_Teleportstation_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)//SC war schon bei den Wassermagiern
	&& (SCUsed_TELEPORTER == TRUE)			//SC hat schon mal einen Teleporter benutzt
	&& (MIS_Lares_BringRangerToMe != 0) 				//hat Aquamarinring von Lares bekommen. -> für Orlan
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Teleportstation_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_Teleportstation_15_00"); //¿Has usado alguna vez una piedra de teletransporte?
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_01"); //No, pero he oído hablar de ellas. Los Magos de Agua aún no están muy seguros al respecto.
	AI_Output	(other, self, "DIA_Addon_Lares_Teleportstation_15_02"); //Yo he probado una.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_03"); //(ríe) ¡Cómo no ibas a probarla! No tienes miedo a nada, ¿verdad?
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_04"); //Si quieres utilizarlas, pregúntale a Orlan, el dueño de la taberna, si te deja entrar a su cueva entablillada.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_05"); //Creo que les ha escondido a los Magos de Agua una de las piedras de teletransporte cerca de su taberna.
	AI_Output	(self, other, "DIA_Addon_Lares_Teleportstation_09_06"); //Sal por la puerta este de la ciudad y sigue el sendero. No tiene pérdida.
	
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Lares me ha dicho que Orlan ha escondido una piedra de teletransporte cerca de su taberna."); 
	Orlan_Hint_Lares = TRUE;
};



// ************************************************************
// 							Ornament
// ************************************************************
// ------------------------------------------------------------
// Ornament von Vatras
// ------------------------------------------------------------
instance DIA_Addon_Lares_Ornament		(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_Ornament_Condition;
	information	= DIA_Addon_Lares_Ornament_Info;

	description	= "Vatras me ha dado este ornamento para ti.";
};
func int DIA_Addon_Lares_Ornament_Condition ()
{
	if (Npc_HasItems (other,ItMi_Ornament_Addon_Vatras))
	&& (Npc_KnowsInfo (other, DIA_Addon_Lares_Vatras))
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Ornament_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Ornament_15_00"); //Vatras me dio este ornamento para que te lo trajera. Dice que hay que devolverlo.
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output (self, other, "DIA_Addon_Lares_Ornament_09_01"); //(suspira) Claro. Yo cargo con el muerto, como siempre. Debería haberlo imaginado.
	AI_Output (self, other, "DIA_Addon_Lares_Ornament_09_02"); //Tendrá que atravesar media isla para llevárselo a los Magos de Agua.
};
// ------------------------------------------------------------
// Ornament BringJob
// ------------------------------------------------------------
instance DIA_Addon_Lares_OrnamentBringJob		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_OrnamentBringJob_Condition;
	information	= DIA_Addon_Lares_OrnamentBringJob_Info;

	description = "¡Puedo llevar el ornamento por ti!";
};
func int DIA_Addon_Lares_OrnamentBringJob_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lares_Ornament))
	&& (MIS_Addon_Lares_Ornament2Saturas == 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_OrnamentBringJob_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_OrnamentBringJob_15_00"); //¡Puedo llevar el ornamento por ti!
	AI_Output	(self, other, "DIA_Addon_Lares_OrnamentBringJob_09_01"); //(pensativo ) Mmh. Será mejor que lo lleve en persona, pero podrías acompañarme.
	AI_Output	(self, other, "DIA_Addon_Lares_OrnamentBringJob_09_02"); //El único problema es que no me puedo ir ahora. Tengo que vigilar el puerto.
	
	B_LogEntry (TOPIC_Addon_KDW,"Le he entregado a Lares el ornamento de Vatras. Quiere llevárselo a los Magos de Agua. Debería acompañarle."); 
	
	MIS_Addon_Lares_Ornament2Saturas = LOG_RUNNING;
};
// ------------------------------------------------------------
// Hol Ablösung
// ------------------------------------------------------------
instance DIA_Addon_Lares_YourMission		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_YourMission_Condition;
	information	= DIA_Addon_Lares_YourMission_Info;
	permanent 	= TRUE;
	description = "¿Cuál es tu cometido en el puerto exactamente?";
};
func int DIA_Addon_Lares_YourMission_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lares_Ornament))
	&& (MIS_Lares_BringRangerToMe == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_YourMission_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_YourMission_15_00"); //¿Cuál es tu cometido en el puerto exactamente?
	
	if (!Npc_KnowsInfo (other, DIA_Addon_Lares_WhatAreYouGuys))
	{
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_01"); //No puedo contártelo.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_02"); //Vatras me cortaría el cuello
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_03"); //Estoy haciendo lo que todos. Cumplo la misión que los Magos de Agua me encomiendan.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_04"); //Algunos de los desaparecidos eran pescadores. Con ellos también se esfumaron sus barcos.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_05"); //Por eso estoy aquí, vigilando el puerto. Quizá ocurra algo.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_06"); //Pero podrías ayudarme.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_07"); //Escucha. Te daré mi anillo de aguamarina. Significa que su portador pertenece al 'Anillo de Agua'.
		
		CreateInvItems (self, ItRi_Ranger_Lares_Addon, 1);									
		B_GiveInvItems (self, other, ItRi_Ranger_Lares_Addon, 1);
		SC_GotLaresRing = TRUE;		
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_08"); //Si llevas puesto mi anillo, los demás sabrán que actúas en mi nombre.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_09"); //Consigue a alguien que me releve en mis funciones, para poder devolver el ornamento.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_10"); //Uno de nosotros tiene que vigilar el mercado siempre, pero no sé a quién le toca.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_11"); //Mejor será que vayas a hablar con todos los que haya por allí. Cuando nuestro hombre vea el anillo de aguamarina, hablará contigo.
		AI_Output (self, other, "DIA_Addon_Lares_YourMission_09_12"); //Dile que se ocupe de encontrar a alguien que me releve en el puerto.

		B_LogEntry (TOPIC_Addon_RingOfWater,"Lares me ha dado su anillo de aguamarina (el símbolo secreto del 'Anillo'). Cuando lo lleve, los otros miembros del 'Anillo' se me revelarán."); 

		Log_CreateTopic (TOPIC_Addon_BringRangerToLares, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BringRangerToLares, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BringRangerToLares,"Lares no puede irse del puerto. Voy a ir en persona al mercado con su anillo de aguamarina para buscar a alguien que pueda encargarse de sus obligaciones."); 

		MIS_Lares_BringRangerToMe = LOG_RUNNING;
	};
};
// ------------------------------------------------------------
// Baltram Abloese
// ------------------------------------------------------------
instance DIA_Addon_Lares_BaltramAbloese		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_BaltramAbloese_Condition;
	information	 = 	DIA_Addon_Lares_BaltramAbloese_Info;

	description	 = 	"He hablado con Baltram.";
};
func int DIA_Addon_Lares_BaltramAbloese_Condition ()
{
	if (MIS_Lares_BringRangerToMe == LOG_RUNNING)
	&& (Baltram_Exchange4Lares == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_BaltramAbloese_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_BaltramAbloese_15_00"); //He hablado con Baltram. Encontrará a alguien para sustituirte.
	AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_01"); //Ah. Muy bien. Al fin podremos irnos.
	if (SC_IsRanger == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_02"); //Más vale que guardes tú mi anillo de aguamarina de momento.
		
		if (Npc_KnowsInfo (other, DIA_Addon_Lares_WannaBeRanger))
		{
			AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_03"); //(sonríe) Seguro que te resulta útil.
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Lares_BaltramAbloese_09_04"); //(sonríe) Quién sabe, quizá quieras unirte a nosotros
		};
	};
	MIS_Lares_BringRangerToMe = LOG_SUCCESS;
	Lares_CanBringScToPlaces = TRUE;
};



// ************************************************************
// 						Missing People
// ************************************************************
// ------------------------------------------------------------
// About Missing People
// ------------------------------------------------------------
var int Lares_PeopleMissing_PERM;
// ------------------------------------------------------------
instance DIA_Addon_Lares_PeopleMissing		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 3;
	condition	= DIA_Addon_Lares_PeopleMissing_Condition;
	information	= DIA_Addon_Lares_PeopleMissing_Info;
	permanent 	= TRUE;
	description	= "Sobre esa gente desaparecida…";
};
func int DIA_Addon_Lares_PeopleMissing_Condition ()
{
	if (Lares_RangerHelp == TRUE)
	&& (Lares_PeopleMissing_PERM == FALSE)
	&& ((SC_IsRanger == FALSE)||(MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_PeopleMissing_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_15_00"); //Sobre esa gente desaparecida
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
	Info_AddChoice (DIA_Addon_Lares_PeopleMissing, DIALOG_BACK, DIA_Addon_Lares_PeopleMissing_BACK);
	if (MissingPeopleReturnedHome == TRUE)
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "He conseguido rescatar a algunos de los desparecidos.", DIA_Addon_Lares_PeopleMissing_SAVED );
	}
	else if (MIS_Lares_BringRangerToMe != 0)
	&& (SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "Sé qué ha sido de los desaparecidos.", DIA_Addon_Lares_PeopleMissing_Success );
	}
	else
	{
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "¿No debe ocuparse la milicia?", DIA_Addon_Lares_PeopleMissing_MIL );
		Info_AddChoice (DIA_Addon_Lares_PeopleMissing, "Dime lo que sepas.", DIA_Addon_Lares_PeopleMissing_TellMe );
	};
};
func void DIA_Addon_Lares_PeopleMissing_BACK()
{
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};
func void DIA_Addon_Lares_PeopleMissing_TellMe()
{
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_TellMe_15_00"); //Dime lo que sepas.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_01"); //El primero fue William, uno de los pescadores de Khorinis. Un buen día no volvió, sin más.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_02"); //Al principio, pensamos que uno de esos monstruos marinos se lo había merendado con su barca.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_03"); //Pero al poco tiempo empezó a desaparecer más gente de la ciudad y los alrededores. Cada uno de una forma, eso sí.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_04"); //Hasta ahora, nadie ha vuelto a aparecer. Por lo que parece, tendremos que esperar hasta dar con alguna pista.

		if (SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
			B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
		};

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 

	SC_HearedAboutMissingPeople = TRUE;
};
func void DIA_Addon_Lares_PeopleMissing_MIL()
{
	AI_Output (other, self, "DIA_Addon_Lares_PeopleMissing_MIL_15_00"); //¿No debería ocuparse la milicia?
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_MIL_09_01"); //La milicia no sirve para nada, en mi opinión.
	AI_Output (self, other, "DIA_Addon_Lares_PeopleMissing_MIL_09_02"); //Nunca van a aclarar nada de esto. Esa gente ha desaparecido sin más.
};
func void DIA_Addon_Lares_PeopleMissing_Success()
{
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_00"); //¡Yo sé lo que les ha pasado a todos!
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_01"); //(sorprendido) ¿De veras?
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_02"); //Raven, el antiguo Magnate del Mineral los ha secuestrado.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_03"); //¿Estás seguro? Entonces hay que liberarlos.
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_04"); //Estoy en ello.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_05"); //Muy bien. Pero ya sabes, si necesitas mi ayuda
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_06"); //…ya sé dónde encontrarte. Entendido.
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};
func void DIA_Addon_Lares_PeopleMissing_SAVED ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_PeopleMissing_SAVED_15_00"); //He rescatado a algunos de los desaparecidos.
	AI_Output	(self, other, "DIA_Addon_Lares_PeopleMissing_SAVED_09_01"); //Sabía que lo conseguirías. Ahora ya puedo ocuparme de mis propios asuntos.
	B_GivePlayerXP (XP_Ambient);
	Lares_PeopleMissing_PERM = TRUE;
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices (DIA_Addon_Lares_PeopleMissing);
};



// ************************************************************
// 								Hilfe
// ************************************************************
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung;
// ------------------------------------------------------------
instance DIA_Addon_Lares_RangerHelp		(C_INFO)
{
	npc		 	= VLK_449_Lares;
	nr		 	= 2;
	condition	= DIA_Addon_Lares_RangerHelp_Condition;
	information	= DIA_Addon_Lares_RangerHelp_Info;
	permanent	= TRUE;
	description	= "Necesito tu ayuda.";
};
func int DIA_Addon_Lares_RangerHelp_Condition ()
{
	if 
	(
		   (Lares_RangerHelp == TRUE)
		&& (DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE)
		&& (DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE)
		&& (DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE)
	)
	|| (Npc_IsInState (Moe, ZS_Attack))
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_RangerHelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_RangerHelp_15_00"); //Necesito tu ayuda.
	AI_Output	(self, other, "DIA_Addon_Lares_RangerHelp_09_01"); //¿Y en qué estabas pensando exactamente?
	
	Info_ClearChoices	(DIA_Addon_Lares_RangerHelp);
	Info_AddChoice (DIA_Addon_Lares_RangerHelp, DIALOG_BACK, DIA_Addon_Lares_RangerHelp_nix );
	
	if (Npc_IsInState (Moe, ZS_Attack))
	{
		Info_AddChoice (DIA_Addon_Lares_RangerHelp, "¡Ese tipo no me deja en paz!", DIA_Addon_Lares_RangerHelp_Moe);
	};
		
	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "Necesito un arma mejor.", DIA_Addon_Lares_RangerHelp_waffe );
	};

	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "¿Qué tal una armadura mejor?", DIA_Addon_Lares_RangerHelp_ruestung );
	};

	if (DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE)
	&& (Lares_RangerHelp == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Lares_RangerHelp, "Necesito dinero.", DIA_Addon_Lares_RangerHelp_geld );
	};
};
func void DIA_Addon_Lares_RangerHelp_ruestung ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_ruestung_15_00"); //¿Qué tal una armadura mejor?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_01"); //Mmh. Matteo vende armaduras, pero seguro que te pide un ojo de la cara.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_02"); //Pero hay una forma más barata de conseguirla, si no te importa jugarle una mala pasada a la milicia...
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_ruestung_15_03"); //¿A qué te refieres?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_04"); //Hay una zona de almacenamiento cerca de la casa de Matteo, pero la milicia ha confiscado toda la mercancía.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_05"); //Busca a Zuris en el mercado y consigue un conjuro de dormir. Luego manda a los guardias al país de los sueños.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_06"); //Seguro que encuentras una buena armadura entre el material de Matteo
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung = TRUE;
};
func void DIA_Addon_Lares_RangerHelp_waffe ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_waffe_15_00"); //Necesito un arma mejor.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_waffe_09_01"); //Pues me temo que no puedo ayudarte. ¿Has probado en el mercado?
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe = TRUE;
};
func void DIA_Addon_Lares_RangerHelp_geld ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_geld_15_00"); //Necesito dinero.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_geld_09_01"); //Como todos, ¿no? Lo siento, pero no puedo darte nada. Pero Lehmar, el prestamista, me debe un favor.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_geld_09_02"); //Visítalo y pídele todo el dinero que necesites, yo me ocuparé del resto. Encontrarás a Lehmar en la zona del puerto, junto a la parte baja de la ciudad.
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld = TRUE;
	RangerHelp_LehmarKohle = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_RangerHelp);
};
func void DIA_Addon_Lares_RangerHelp_nix ()
{
	Info_ClearChoices	(DIA_Addon_Lares_RangerHelp);
};
// ------------------------------------------------------------
// Moe
// ------------------------------------------------------------
func void DIA_Addon_Lares_RangerHelp_Moe()
{
	AI_Output (other, self, "DIA_Addon_Lares_Moe_15_00"); //Ese tipo me está molestando
	AI_Output (self, other, "DIA_Addon_Lares_Moe_09_01"); //No por mucho tiempo
	Info_ClearChoices (DIA_Addon_Lares_RangerHelp);
	AI_StopProcessInfos (self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack (self, Moe, AR_GuardStopsFight, 0);
};



// ************************************************************
// ***														***
// 							Gothic II
// ***														***
// ************************************************************



// ************************************************************
// 			  			Paladine und GILDE
// ************************************************************
// ------------------------------------------------------------
// Paladine
// ------------------------------------------------------------
instance DIA_Lares_Paladine	(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	4;
	condition	 = 	DIA_Lares_Paladine_Condition;
	information	 = 	DIA_Lares_Paladine_Info;
	permanent    =  FALSE;
	description	 = 	"Tengo que hablar con los paladines, ¡como sea!";
};
func int DIA_Lares_Paladine_Condition ()
{	
	if (other.guild == GIL_NONE)
	&& (RangerHelp_gildeMIL == FALSE)
	&& (RangerHelp_gildeSLD == FALSE)
	&& (RangerHelp_gildeKDF == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lares_Paladine_Info ()
{
	AI_Output (other, self, "DIA_Lares_Paladine_15_00"); //Debo hablar con los paladines, ¡cueste lo que cueste!
	AI_Output (self, other, "DIA_Lares_Paladine_09_01"); //¿Qué quieres de ELLOS?
	AI_Output (other, self, "DIA_Lares_Paladine_15_02"); //Tienen un poderoso amuleto, el Ojo de Innos. Lo necesito.
	AI_Output (self, other, "DIA_Lares_Paladine_09_03"); //¿Y crees que te lo van a dar? Nunca conseguirás entrar en el barrio alto de la ciudad.
	if (!Npc_KnowsInfo (other, DIA_Addon_Lares_Vatras))
	{
		AI_Output (other, self, "DIA_Lares_Paladine_15_04"); //Encontraré alguna forma.
		AI_Output (self, other, "DIA_Lares_Paladine_09_05"); //Claro, si quieres congraciarte con los ciudadanos o hacer de chico de los recados para la milicia...
	};
	
	//AI_Output (other, self, "DIA_Lares_Alternative_15_00"); //Hab' ich eine Alternative?
	//AI_Output (self, other, "DIA_Lares_Alternative_09_01"); //Wenn ich du wäre, würde ich zu Onars Hof gehen und mit Lee reden.
	//AI_Output (self, other, "DIA_Lares_Alternative_09_02"); //Ich bin mir sicher, wir finden einem Weg, dich ins obere Viertel zu bringen.
};	

// ------------------------------------------------------------
// 			  			Warum Paladine hier?
// ------------------------------------------------------------
instance DIA_Lares_WhyPalHere		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	4;
	condition	 = 	DIA_Lares_WhyPalHere_Condition;
	information	 = 	DIA_Lares_WhyPalHere_Info;
	permanent    =  FALSE;
	description	 = 	"¿Sabes qué están haciendo aquí los paladines?";
};
func int DIA_Lares_WhyPalHere_Condition ()
{	
	if (other.guild == GIL_NONE)
	{
		if (Npc_KnowsInfo (other, DIA_Lares_Paladine))
		|| (RangerHelp_gildeMIL == TRUE)
		|| (RangerHelp_gildeSLD == TRUE)
		|| (RangerHelp_gildeKDF == TRUE)
		{
			return TRUE;
		};
	};
};
func void DIA_Lares_WhyPalHere_Info ()
{
	AI_Output (other, self, "DIA_Lares_WhyPalHere_15_00"); //¿Sabes qué están haciendo aquí los paladines?
	AI_Output (self, other, "DIA_Lares_WhyPalHere_09_01"); //Nadie lo sabe con certeza... Mucha gente cree que es por los orcos, pero creo que hay otra razón.
	AI_Output (self, other, "DIA_Lares_WhyPalHere_09_02"); //Probablemente tiene algo que ver con la vieja colonia penal.
};	

// ------------------------------------------------------------
// 			  			Guild Bypass
// ------------------------------------------------------------
instance DIA_Addon_Lares_Gilde (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Addon_Lares_Gilde_Condition;
	information	 = 	DIA_Addon_Lares_Gilde_Info;
	permanent    =  TRUE;
	description	 = 	"Vatras dijo que podías ayudarme a unirme a una comunidad.";
};
func int DIA_Addon_Lares_Gilde_Condition ()
{	
	if (Lares_RangerHelp == TRUE)
	&& (other.guild == GIL_NONE)
	&& (RangerHelp_gildeMIL == FALSE)
	&& (RangerHelp_gildeSLD == FALSE)
	&& (RangerHelp_gildeKDF == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Gilde_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_15_00"); //Vatras dijo que podías ayudarme a unirme a una comunidad.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_01"); //(ríe) Cansado de ser el último mono, ¿no?
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_02"); //Muy bien. Te comprendo.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_03"); //Puedo utilizar mi influencia con los mercenarios si quieres unirte a Lee.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_04"); //Seguro que encontramos el modo de que entres pronto en el monasterio.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_05"); //Aunque lo más sencillo para ti sería unirte a la milicia.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_09_06"); //¿Qué comunidad prefieres?
		
	Info_ClearChoices (DIA_Addon_Lares_Gilde);
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Me lo pensaré…", DIA_Addon_Lares_Gilde_BACK);
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Los Magos de Fuego.", DIA_Addon_Lares_Gilde_KDF );
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "Los mercenarios.", DIA_Addon_Lares_Gilde_SLD );	
	Info_AddChoice	(DIA_Addon_Lares_Gilde, "La milicia.", DIA_Addon_Lares_Gilde_MIL );
};
func void DIA_Addon_Lares_Gilde_BACK ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_BACK_15_00"); //Tendré que meditarlo
	Info_ClearChoices (DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_SLD ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_SLD_15_00"); //Los mercenarios.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_01"); //Seguro que Lee te acepta.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_Add_09_01"); //Pero antes tendrás que superar una prueba.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_02"); //Ve y habla con Cord en la granja de Onar.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_Add_09_02"); //Te puede ayudar con la prueba.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_SLD_09_03"); //Dile que vives bajo mi protección. Sabrá entenderlo.
	RangerHelp_gildeSLD = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpSLD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpSLD, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"Lares ha dicho que ese tal mercenario Cord podría hacerme la vida más fácil en la granja del propietario."); 
	
	SC_KnowsCordAsRangerFromLares = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_MIL ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_MIL_15_00"); //La milicia.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_01"); //(divertido) Sí, me imagino que eso te gustaría, ¿eh? Leer las leyes a otros mientras te embolsas sus ganancias.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_02"); //Los paladines tienen su almacén de provisiones junto al puerto. El maestro de provisiones es un buen amigo mío.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_MIL_09_03"); //Quizá pueda hacer algo por ti. Se llama Martin.

	Log_CreateTopic (TOPIC_Addon_RangerHelpMIL, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpMIL, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Lares ha dicho que el maestro de provisiones Martin me ayudará a unirme a la milicia pronto. Suele estar por el puerto, cerca del almacén de los paladines."); 
	
	RangerHelp_gildeMIL = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};
func void DIA_Addon_Lares_Gilde_KDF ()
{
	AI_Output (other, self, "DIA_Addon_Lares_Gilde_KDF_15_00"); //Los Magos de Fuego.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_01"); //(ríe) Apuesto a que Vatras no se esperaba esto o no te hubiera enviado a mí.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_02"); //Unirse al monasterio sale caro.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_03"); //Esa gente no te dejará ni pasar a menos que les pagues un tributo.
	AI_Output (self, other, "DIA_Addon_Lares_Gilde_KDF_09_04"); //Y el único que podría hacer algo al respecto es el propio Vatras. Más vale que hables con él sobre esto.

	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Lares ha dicho que Vatras conoce un modo fácil de entrar al monasterio."); 

	RangerHelp_gildeKDF = TRUE;
	Info_ClearChoices	(DIA_Addon_Lares_Gilde);
};


// ------------------------------------------------------------
// 			  					About Sld
// ------------------------------------------------------------
var int Lares_WorkForLee;
var int Lares_WayToOnar;
// ------------------------------------------------------------
instance DIA_Lares_AboutSld (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	10;
	condition	 = 	DIA_Lares_AboutSld_Condition;
	information	 = 	DIA_Lares_AboutSld_Info;
	permanent    =  TRUE;
	description	 = 	"Háblame más de Lee y sus mercenarios…";
};
func int DIA_Lares_AboutSld_Condition ()
{	
	if (other.guild == GIL_NONE)
	&& (Lares_WayToOnar == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lares_AboutSld_Info ()
{
	AI_Output (other,self,  "DIA_ADDON_Lares_AboutSld_15_00"); //Háblame más de Lee y sus mercenarios.
	AI_Output (self, other, "DIA_ADDON_Lares_AboutSld_09_01"); //¿Qué quieres saber?
	
	Info_ClearChoices (DIA_Lares_AboutSld);
	Info_AddChoice (DIA_Lares_AboutSld, DIALOG_BACK, DIA_Lares_AboutSld_BACK);
	Info_AddChoice (DIA_Lares_AboutSld, "¿Por qué NO estás con Lee y sus mercenarios?", DIA_Lares_AboutSld_WhyNotYou);
	Info_AddChoice (DIA_Lares_AboutSld, "Háblame más de los mercenarios...", DIA_Lares_AboutSld_Sld);
	Info_AddChoice (DIA_Lares_AboutSld, "¿Cómo encuentro la granja del hacendado?", DIA_Lares_AboutSld_WayToOnar); 
};
func void DIA_Lares_AboutSld_BACK()
{
	Info_ClearChoices (DIA_Lares_AboutSld);
};
func void DIA_Lares_AboutSld_Sld()
{	
	AI_Output (other,self,  "DIA_Lares_AboutSld_15_00"); //Cuéntame más sobre los mercenarios.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_01"); //Bueno, si eres tan duro como eras antes, no deberías tener ningún problema con ellos.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_02"); //La mayoría son rufianes y si no puedes estar a su altura, no llegarás lejos.
	AI_Output (self, other, "DIA_Lares_AboutSld_09_03"); //(Se ríe) Si eres un remilgado no tienes ninguna oportunidad de integrarte con ellos...
};	
func void DIA_Lares_AboutSld_WhyNotYou()
{
	AI_Output (other, self, "DIA_Lares_WhyInCity_15_00"); //¿Por qué NO estás con Lee y sus mercenarios?
	AI_Output (self, other, "DIA_Lares_WhyInCity_09_01"); //¡Pero si estoy! Lo que pasa es que no en la granja.
	AI_Output (self, other, "DIA_Lares_WhyInCity_09_02"); //Se podría decir que soy nuestra avanzadilla en la ciudad. No queremos que el barco se vaya sin nosotros.
	//AI_Output (self, other, "DIA_Lares_WhyInCity_09_03"); //Warum bist DU in die Stadt gekommen?
	Lares_WorkForLee = TRUE;
	
	Info_AddChoice (DIA_Lares_AboutSld, "¿De qué barco estabas hablando?", DIA_Lares_AboutSld_Schiff);
};
func void DIA_Lares_AboutSld_Schiff()
{	
	AI_Output (other,self , "DIA_Lares_Schiff_15_00"); //¿De qué barco estabas hablando?
	AI_Output (self, other, "DIA_Lares_Schiff_09_01"); //Está en el puerto abierto al mar, detrás del acantilado. Lee y unos cuantos de los suyos quieren salir de aquí.
	AI_Output (self, other, "DIA_Lares_Schiff_09_02"); //Pero podría llevar un tiempo...
	AI_Output (other,self , "DIA_Lares_Schiff_15_03"); //¿Por qué?
	AI_Output (self, other, "DIA_Lares_Schiff_09_04"); //Sería mejor que se lo preguntases a Lee, si le ves... tiene sus planes.
};
func void DIA_Lares_AboutSld_WayToOnar()
{
	AI_Output (other,self, "DIA_Lares_WegZumHof_15_00"); //¿Cómo encuentro la granja del hacendado?
	AI_Output (self, other, "DIA_Addon_Lares_WegZumHof_09_00"); //Es muy fácil. Sales del puerto marítimo por la puerta este y sigues el sendero hacia el este.
	AI_Output (self, other, "DIA_Addon_Lares_WegZumHof_09_01"); //Puedo llevarte, si quieres.
	//AI_Output (self, other, "DIA_Lares_WegZumHof_09_01"); //Ich kann dich hinbringen, wenn du willst. Hab sowieso schon zu lange hier rumgehangen.
	//AI_Output (self, other, "DIA_Lares_WegZumHof_09_02"); //Hier im Hafen gibt es zwar für gewöhnlich keine Miliz, aber ich muss ja nicht riskieren, dass einer von ihnen Verdacht schöpft ...
	Lares_WayToOnar = TRUE;
};	



// ************************************************************
// 			  			GuildOfThieves
// ************************************************************
// ------------------------------------------------------------
// About Thieves
// ------------------------------------------------------------
instance DIA_Lares_GuildOfThieves (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	14;
	condition	 = 	DIA_Lares_GuildOfThieves_Condition;
	information	 = 	DIA_Lares_GuildOfThieves_Info;
	permanent    =  FALSE;
	description	 = 	"¿Sabes algo sobre una cofradía de ladrones en la ciudad?";
};
func int DIA_Lares_GuildOfThieves_Condition ()
{	
	if (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Lares_GuildOfThieves_Info ()
{
	AI_Output (other, self, "DIA_Lares_GuildOfThieves_15_00"); //¿Sabes algo sobre una cofradía de ladrones en la ciudad?
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_01"); //Las preguntas que haces...
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_02"); //Naturalmente, hay una cofradía de ladrones aquí. Como en todas las grandes ciudades.
	AI_Output (self, other, "DIA_Lares_GuildOfThieves_09_03"); //Y todos los ladronzuelos y coyotes están probablemente conectados a ella de alguna forma.
};	
// ------------------------------------------------------------
// Wo finden?
// ------------------------------------------------------------
instance DIA_Lares_WhereGuildOfThieves (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	15;
	condition	 = 	DIA_Lares_WhereGuildOfThieves_Condition;
	information	 = 	DIA_Lares_WhereGuildOfThieves_Info;
	permanent    =  FALSE;
	description	 = 	"¿Sabes dónde puedo encontrar la cofradía de ladrones?";
};
func int DIA_Lares_WhereGuildOfThieves_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lares_GuildOfThieves))
	&& (DG_gefunden == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lares_WhereGuildOfThieves_Info ()
{
	AI_Output (other, self, "DIA_Lares_WhereGuildOfThieves_15_00"); //¿Sabes dónde puedo encontrar la cofradía de ladrones?
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_01"); //(Se ríe) No te ofendas pero, aunque lo supiera, no te diría nada.
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_02"); //Esta gente suele reaccionar MUY susceptiblemente ante cosas como ésas.
	AI_Output (self, other, "DIA_Lares_WhereGuildOfThieves_09_03"); //Si quieres ponerte en contacto con ellos, deberías tener mucho cuidado.
};
// ------------------------------------------------------------
// Meersalz Schlüssel
// ------------------------------------------------------------
instance DIA_Lares_GotKey (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	16;
	condition	 = 	DIA_Lares_GotKey_Condition;
	information	 = 	DIA_Lares_GotKey_Info;
	permanent    =  FALSE;
	description	 = 	"Tengo esta llave de aquí. Ha sido corroída por la sal marina...";
};
func int DIA_Lares_GotKey_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lares_WhereGuildOfThieves))
	&& (Npc_HasItems (other, ItKe_ThiefGuildKey_MIS))
	&& (DG_gefunden == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lares_GotKey_Info ()
{
	AI_Output (other, self, "DIA_Lares_GotKey_15_00"); //Tengo esta llave de aquí. Ha sido corroída por la sal marina...
	AI_Output (self, other, "DIA_Lares_GotKey_09_01"); //¿Y?
	AI_Output (other,self, "DIA_Lares_GotKey_15_02"); //Creo que me llevará a la guarida de la cofradía de ladrones...
	AI_Output (self, other, "DIA_Lares_GotKey_09_03"); //Bueno, podría ser la llave de las alcantarillas.
};
// ------------------------------------------------------------
// Kanalisation
// ------------------------------------------------------------
instance DIA_Lares_Kanalisation (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	17;
	condition	 = 	DIA_Lares_Kanalisation_Condition;
	information	 = 	DIA_Lares_Kanalisation_Info;
	permanent    =  FALSE;
	description	 = 	"¿Dónde puedo encontrar las alcantarillas?";
};
func int DIA_Lares_Kanalisation_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lares_GotKey))
	&& (DG_gefunden == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lares_Kanalisation_Info ()
{
	AI_Output (other,self, "DIA_Lares_Kanalisation_15_00"); //¿Dónde puedo encontrar las alcantarillas?
	AI_Output (self, other, "DIA_Lares_Kanalisation_09_01"); //Qué sé yo... normalmente suelen desaguar en el océano.
};

// ************************************************************
// 		  			Important für andere Gilden
// ************************************************************
instance DIA_Lares_OtherGuild (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	1;
	condition	 = 	DIA_Lares_OtherGuild_Condition;
	information	 = 	DIA_Lares_OtherGuild_Info;
	permanent    =  FALSE;
	important 	 = 	TRUE;
};
func int DIA_Lares_OtherGuild_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (other.guild != GIL_NONE)
	&& (SC_IsRanger == FALSE)//ADDON
	{
		return TRUE;
	};
};
func void DIA_Lares_OtherGuild_Info ()
{
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		if (other.guild == GIL_MIL)
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_00"); //¡Ahora estás en la milicia!
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_01"); //(Se ríe) Me meo de la risa: un antiguo convicto en la milicia...
		}
		else //GIL_PAL
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_02"); //¡Así que ahora eres uno de los paladines del Rey!
		};
	
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_03"); //(Con picardía) Solo a ti se te ocurriría algo así...
	
		if (Lares_WorkForLee == TRUE)
		{
			AI_Output (self, other, "DIA_Lares_OtherGuild_09_04"); //(Preocupado) ¿No me delatarás por trabajar para Lee, verdad?
			AI_Output (other,self , "DIA_Lares_OtherGuild_15_05"); //Pero tú me conoces...
		};
	};
	
	if (other.guild == GIL_KDF) 
	|| (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_06"); //No lo pillo. Entraste en el monasterio. ¿Y cómo es aquello?
		AI_Output (other,self , "DIA_Lares_OtherGuild_15_07"); //Diferente.
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_08"); //Puedo imaginármelo.
	};
		
	if (other.guild == GIL_SLD) 
	|| (other.guild == GIL_DJG)
	{
		//AI_Output (self, other, "DIA_Lares_OtherGuild_09_09"); //Ich hab gehört, du bist aufgenommen worden.
		AI_Output (self, other, "DIA_Addon_Lares_OtherGuild_09_00"); //He oído que has sido aceptado para unirte Lee.
		AI_Output (self, other, "DIA_Lares_OtherGuild_09_10"); //Enhorabuena.
	};
};



// ************************************************************
// ***														***
// 							Die Latscherei
// ***														***
// ************************************************************
instance DIA_Addon_Lares_Forest (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	9;
	condition	 = 	DIA_Addon_Lares_Forest_Condition;
	information	 = 	DIA_Addon_Lares_Forest_Info;

	description	 = 	"¿Me ayudas a atravesar los espesos bosques del este?";
};
func int DIA_Addon_Lares_Forest_Condition ()
{	
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Forest_info ()
{
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_00"); //¿Puedes ayudarme a atravesar los frondosos bosques del este?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_01"); //Vale. Pero ¿para qué quieres ir allí?
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_02"); //Nefarius me ha ordenado buscar más ornamentos.
	AI_Output (other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_03"); //Uno de los sitios donde debo buscar es en mitad de los bosques.
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_04"); //Comprendo. Y es peligroso para ti solo, ¿verdad?
	AI_Output (self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_05"); //Tranquilo. Avísame cuando quieras partir.

	RangerHelp_OrnamentForest = TRUE;
};


// ------------------------------------------------------------
// Lass uns gehen...
// ------------------------------------------------------------
instance DIA_Lares_GoNow (C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	10;
	condition	 = 	DIA_Lares_GoNow_Condition;
	information	 = 	DIA_Lares_GoNow_Info;
	permanent    =  TRUE;
	description	 = 	"De acuerdo, vamos.";
};
func int DIA_Lares_GoNow_Condition ()
{	
	if (
		(Lares_WayToOnar == TRUE)
	 	|| (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	 	|| (RangerHelp_OrnamentForest == TRUE)
	 	)
	 	&& ((LaresGuide_ZumPortal == 0)||(LaresGuide_ZumPortal == 8))
	 	&& ((LaresGuide_ZuOnar == FALSE) || (LaresGuide_ZuOnar == LOG_SUCCESS))
	 	&& ((LaresGuide_OrnamentForest == 0)||(LaresGuide_OrnamentForest == 3))
		&& (Kapitel < 3)
			{
				return TRUE;
			};
};

func void DIA_Lares_GoNow_GoingConditions ()
{	
 	AI_Output (self, other, "DIA_Lares_GoNow_09_01"); //Pues vamos... sígueme.
	AI_StopProcessInfos (self);
	
	Lares_Guide = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	if (Npc_KnowsInfo (other, DIA_Moe_Hallo) == FALSE)
	{
		Npc_SetRefuseTalk (Moe,30);
	};
};

func void DIA_Lares_GoNow_Info ()
{
	AI_Output (other, self, "DIA_Lares_GoNow_15_00"); //Okay, lass uns gehen.
	
	if (Lares_CanBringScToPlaces == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Lares_GoNow_09_03"); //No me puedo ir de aquí hasta que no sepa algo más de los desaparecidos o hasta que alguien me releve.
	}
	else if (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING) //bleibt am Hafen während RangerMeeting
	{
		B_Lares_Geheimtreffen();
	}
	else
	{
			AI_Output (self, other, "DIA_Addon_Lares_GoNow_09_04"); //¿A dónde?
			
			
			Info_ClearChoices	(DIA_Lares_GoNow);
			Info_AddChoice	(DIA_Lares_GoNow, DIALOG_BACK, DIA_Lares_GoNow_warte );
		
			if (Lares_WayToOnar == TRUE) && (LaresGuide_ZuOnar != LOG_SUCCESS)
			{
				Info_AddChoice	(DIA_Lares_GoNow, "A la granja de Onar.", DIA_Lares_GoNow_Onar );
			};
		
			if ((MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) && (Lares_Angekommen == FALSE))
			{
				Info_AddChoice	(DIA_Lares_GoNow, "Vamos a devolver el ornamento de Vatras.", DIA_Lares_GoNow_Maya );
			};
			
			if ((ORNAMENT_SWITCHED_FOREST == FALSE) && (LaresGuide_OrnamentForest == 0) && (RangerHelp_OrnamentForest == TRUE))
			{
				Info_AddChoice	(DIA_Lares_GoNow, "Al bosque frondoso del este.", DIA_Lares_GoNow_Forest );
			};
	};		
};

func void DIA_Lares_GoNow_Maya ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Maya_15_00"); //Vamos a devolver el ornamento de Vatras.
	LaresGuide_ZumPortal = 1;
	Npc_ExchangeRoutine (self, "GUIDEPORTALTEMPEL1");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_Onar ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Onar_15_00"); //A la granja de Onar.
	LaresGuide_ZuOnar = TRUE;
	Npc_ExchangeRoutine (self, "GUIDE");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_Forest ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_GoNow_Forest_15_00"); //Al bosque frondoso del este.
	LaresGuide_OrnamentForest = 1;
	Npc_ExchangeRoutine (self, "GUIDEMEDIUMWALD1");
	DIA_Lares_GoNow_GoingConditions(); 
};

func void DIA_Lares_GoNow_warte ()
{
	Info_ClearChoices	(DIA_Lares_GoNow);
};

// ************************************************************
// 			  					Angekommen 
// ************************************************************
instance DIA_Lares_GUIDE		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	1;
	condition	 = 	DIA_Lares_GUIDE_Condition;
	information	 = 	DIA_Lares_GUIDE_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Lares_GUIDE_Condition ()
{	
	if (LaresGuide_ZuOnar == TRUE)
	&& Hlp_StrCmp 	 (Npc_GetNearestWP(self),"NW_TAVERNE_BIGFARM_05")
	{
		return TRUE;
	};
};
func void DIA_Lares_GUIDE_Info ()
{
	if Lares_Guide > (Wld_GetDay()-2)
	{
		AI_Output (self, other, "DIA_Lares_GUIDE_09_00"); //Bueno, aquí estamos.
	}
	else
	{
		AI_Output (self, other, "DIA_Lares_GUIDE_09_01"); //Ahí estás. Empezaba a pensar que te habían comido los lobos.
	};
	AI_Output (self, other, "DIA_Lares_GUIDE_09_02"); //Pues el resto del camino lo puedes hacer solo. Yo tengo que regresar a la ciudad, tengo unas cuantas cosas de las que ocuparme...
	AI_Output (self, other, "DIA_Lares_GUIDE_09_03"); //Basta con que sigas esta carretera de aquí. Y recuerda: defiéndete solo y no dejes que se rían de ti. Todo irá bien.
	
	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	
	Npc_ExchangeRoutine (self,"START");
	LaresGuide_ZuOnar = LOG_SUCCESS; //Joly: schluss mit Onar guide
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInter1
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInter1		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInter1_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInter1_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInter1_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_CITY_TO_FOREST_11")
	&& (LaresGuide_ZumPortal == 1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInter1_Info ()
{
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_09_00"); //Ya que hemos salido de la ciudad y nadie nos oye, te contaré más cosas.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_09_01"); //Vamos a devolverle a Saturas este ornamento que me has traído. Te acuerdas de Saturas, ¿no?
	
	
	Info_ClearChoices	(DIA_Addon_Lares_ArrivedPortalInter1);
	Info_AddChoice	(DIA_Addon_Lares_ArrivedPortalInter1, "Claro.", DIA_Addon_Lares_ArrivedPortalInter1_ja );
	Info_AddChoice	(DIA_Addon_Lares_ArrivedPortalInter1, "¿Saturas? ¿Quién es?", DIA_Addon_Lares_ArrivedPortalInter1_wer );

	LaresGuide_ZumPortal = 2;
};

func void DIA_Addon_Lares_ArrivedPortalInter1_teil2 ()
{
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00"); //Los compañeros del antiguo Campamento Nuevo seguimos teniendo buena relación con los Magos de Agua.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01"); //Hasta el propio Lee sigue protegiendo a los Magos de Agua de cualquier peligro si está en su mano.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02"); //Para mantener contacto con los Magos de Agua, paso casi todo el tiempo en la ciudad, trabajando con Vatras.
	B_MakeRangerReadyForMeeting (self);
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03"); //Y esta es la armadura que nos dan a todos los Magos de Agua. Los miembros del Anillo de Agua han llevado esta armadura desde las guerras orcas.
	
	if (Cavalorn_RangerHint == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04"); //¿Qué pinta Cavalorn en todo esto? No era seguidor del Campamento Nuevo, por lo que sé.
		AI_Output (self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05"); //Tienes razón, nuestra comunidad ha crecido. Ni yo mismo sé cuántos seremos ahora.
	};

	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06"); //Pero sigamos. Quiero alejarme más de la ciudad. Luego hablaremos más.
	Info_ClearChoices	(DIA_Addon_Lares_ArrivedPortalInter1);
};

func void DIA_Addon_Lares_ArrivedPortalInter1_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00"); //¿Saturas? ¿Quién es?
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01"); //Era el cabecilla de los Magos de Agua en el Campamento Nuevo del Valle de Minas, cuando la Barrera aún nos rodeaba.
	AI_Output			(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02"); //Lee y yo hicimos un pacto por aquel entonces con los Magos de Agua. Juntos fuimos capaces de asaltar el antiguo campamento.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2 ();
};

func void DIA_Addon_Lares_ArrivedPortalInter1_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00"); //Pues claro. Era el líder de los Magos de Agua en el Campamento Nuevo.
	DIA_Addon_Lares_ArrivedPortalInter1_teil2 ();
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TAVERN_TO_FOREST_02")
	&& (LaresGuide_ZumPortal == 2)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter_09_00"); //¿Qué pasa? ¡No te pares!
	
	if (MIS_Addon_Erol_BanditStuff == LOG_RUNNING)
	&& ((Npc_GetDistToWP(Erol,"NW_TAVERN_TO_FOREST_03")<1000))
	&& ((Npc_IsDead(Erol))==FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Lares_ArrivedPortalInterWeiter_15_01"); //Ese tipo de ahí tiene problemas con los bandidos.
		AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter_09_02"); //(con malicia) Lo siento por él, pero ahora no tenemos tiempo.
	};
	
	LaresGuide_ZumPortal = 3;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter2		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TAVERNE_TROLLAREA_14")
	&& (LaresGuide_ZumPortal == 3)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter2_09_00"); //No me retrases ahora.
	LaresGuide_ZumPortal = 4;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInter2		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInter2_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInter2_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInter2_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TROLLAREA_PATH_58")
	&& (LaresGuide_ZumPortal == 4)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInter2_Info ()
{
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_00"); //Los Magos de Agua están fuera de sí. Llevan semanas trabajando en una excavación en el noreste. Nadie tiene ni idea de lo que andan buscando.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_01"); //Todo empezó cuando el suelo comenzó a temblar como en los peores tiempos de la Barrera.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_02"); //Unas horribles criaturas de piedra surgieron de la tierra, matando a todos los que estaban a su alrededor.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_03"); //Los Magos de Agua cogieron la sartén por el mango y aniquilaron a esos invasores hostiles. Y ahora excavan en la zona, buscándole una explicación a lo ocurrido.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_04"); //Pero pronto lo verás por ti mismo.

	LaresGuide_ZumPortal = 5;
	B_LogEntry (TOPIC_Addon_KDW,"Lares me ha hablado de la excavación de los Magos de Agua. Están investigando ciertos asuntos peculiares. Ha habido terremotos misteriosos y unos extraños seres de piedra están emergiendo del suelo."); 
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter3
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter3		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_47") < 200) 	
	&& (LaresGuide_ZumPortal == 5)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter3_09_00"); //¿Puedes continuar?
	LaresGuide_ZumPortal = 6;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter4
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter4		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_02")
	&& (LaresGuide_ZumPortal == 6)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter4_09_00"); //Vale. Por aquí, podría ser más peligroso.
	LaresGuide_ZumPortal = 7;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortal
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortal		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_ArrivedPortal_Condition;
	information	 = 	DIA_Addon_Lares_ArrivedPortal_Info;
	important	 = 	TRUE;

};
func int DIA_Addon_Lares_ArrivedPortal_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) 
	&& Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_41")
	&& (LaresGuide_ZumPortal == 7)
		{
			return TRUE;
		};
};
func void DIA_Addon_Lares_ArrivedPortal_Info ()
{
	B_MakeRangerReadyToLeaveMeeting (self);
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_00"); //Hemos llegado.
 	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_01"); //Toma, el ornamento. Los Magos de Agua deben de estar ahí dentro. Llévaselo.
	B_GiveInvItems (self, other, ItMi_Ornament_Addon_Vatras, 1);					
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_02"); //Si te encuentras alguna bestia en ese agujero que te parezca demasiado fuerte para ti, huye en busca de Saturas.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_03"); //Él se encargará de cualquier criatura. Tengo que volver.
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_04"); //Y una cosa más: no se te ocurra  perder el tiempo con este ornamento. Ve DIRECTAMENTE hacia Saturas
	AI_Output 	(self, other, "DIA_Addon_Lares_ArrivedPortal_09_05"); //Nos vemos.
	
	B_LogEntry (TOPIC_Addon_KDW,"Lares me ha entregado este ornamento. Quiere que se lo entregue a Saturas, el Mago de Agua."); 
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self,"START");
	LaresGuide_ZumPortal = 8; //Joly: schluss mit guide Portal
	
	Lares_Angekommen = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	ALBERN
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_Albern	(C_INFO)
{
	npc			= VLK_449_Lares;
	nr		 	= 1;
	condition	= DIA_Addon_Lares_Albern_Condition;
	information	= DIA_Addon_Lares_Albern_Info;
	important	= TRUE;
};
func int DIA_Addon_Lares_Albern_Condition ()
{
	if (Lares_Angekommen == TRUE)
	&& (Npc_GetDistToWP (self, "NW_TROLLAREA_RUINS_41") > 1000)
	&& (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lares_Albern_Info()
{
	AI_Output (self, other, "DIA_Addon_Lares_Albern_09_00"); //(en tono estricto) ¡Deja de hacer el vago! ¡Llévale ya el ornamento a Saturas!
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info GOFORESTPRE
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_GOFORESTPRE		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_GOFORESTPRE_Condition;
	information	 = 	DIA_Addon_Lares_GOFORESTPRE_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Lares_GOFORESTPRE_Condition ()
{
	if Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_CITY_TO_FARM2_04") 
	&& (LaresGuide_OrnamentForest == 1)
		{
			return TRUE;
		};
};
func void DIA_Addon_Lares_GOFORESTPRE_ja ()
{
	B_MakeRangerReadyForMeeting (self);
	AI_Output	(other, self, "DIA_Addon_Lares_GOFORESTPRE_ja_15_00"); //Sí.
	AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_ja_09_01"); //Muy bien, amigo. Sígueme. Esto va a ser peliagudo.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"GUIDEMEDIUMWALD2");
	LaresGuide_OrnamentForest = 2; 
};
func void DIA_Addon_Lares_GOFORESTPRE_nein ()
{
	AI_Output	(other, self, "DIA_Addon_Lares_GOFORESTPRE_nein_15_00"); //No. Puedes irte.
	AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_nein_09_01"); //Supongo que todo está solucionado, ¿no? Muy bien. Nos vemos.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"Start");
	LaresGuide_OrnamentForest = 3; //Joly: Schluss mit Guide
};

func void DIA_Addon_Lares_GOFORESTPRE_Info ()
{
	if (ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_09_00"); //¿Aún quieres entrar conmigo en el bosque?
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Lares_GOFORESTPRE_09_01"); //¿Has pensado lo de entrar en el bosque? ¿De verdad quieres hacerlo?
 	};
	Info_ClearChoices	(DIA_Addon_Lares_GOFORESTPRE);
	Info_AddChoice	(DIA_Addon_Lares_GOFORESTPRE, "No. Puedes irte.", DIA_Addon_Lares_GOFORESTPRE_nein );
	Info_AddChoice	(DIA_Addon_Lares_GOFORESTPRE, "Sí.", DIA_Addon_Lares_GOFORESTPRE_ja );
};


///////////////////////////////////////////////////////////////////////
//	Info GOFOREST
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_GOFOREST		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_GOFOREST_Condition;
	information	 = 	DIA_Addon_Lares_GOFOREST_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Addon_Lares_GOFOREST_Condition ()
{
	if Hlp_StrCmp  (Npc_GetNearestWP(self),"NW_FOREST_PATH_62") 
	&& (LaresGuide_OrnamentForest == 2)
	&& (Npc_IsDead(Stoneguardian_Ornament))
	{
		if (ORNAMENT_SWITCHED_FOREST == FALSE)
		&& (Npc_IsInState (self,ZS_Talk))
			{
				return TRUE;
			};	
		if (ORNAMENT_SWITCHED_FOREST == TRUE)
			{
				return TRUE;
			};
	};
};

func void DIA_Addon_Lares_GOFOREST_Info ()
{
	if (ORNAMENT_SWITCHED_FOREST == TRUE)
	{	
		B_MakeRangerReadyToLeaveMeeting (self);
		AI_Output 	(self, other, "DIA_Addon_Lares_GOFOREST_09_00"); //Ahí. El resto deberías poder hacerlo solo. Yo ya me vuelvo.
	 	AI_StopProcessInfos (self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine (self,"START");
	 	LaresGuide_OrnamentForest = 3; //Joly: Schluss mit guide Forest!
 	}
 	else
 	{
		AI_Output 	(self, other, "DIA_Addon_Lares_GOFOREST_09_01"); //Deprisa. No quiero quedarme más de lo necesario.
	 	AI_StopProcessInfos (self);
 	};
};

///////////////////////////////////////////////////////////////////////
//	Info PortalInterWEITER
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_PortalInterWEITER		(C_INFO)
{
	npc		 = 	VLK_449_Lares;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lares_PortalInterWEITER_Condition;
	information	 = 	DIA_Addon_Lares_PortalInterWEITER_Info;
	permanent	 = 	TRUE;

	description	 = 	"En marcha.";
};

func int DIA_Addon_Lares_PortalInterWEITER_Condition ()
{
	if (LaresGuide_ZumPortal != 0)
	&& (LaresGuide_ZumPortal != 8)//Joly: schluss mit guide Portal
		{
			return TRUE;
		};
};

func void DIA_Addon_Lares_PortalInterWEITER_Info ()
{
	if (LaresGuide_ZumPortal == 4)
	{
		AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_00"); //Deja de charlotear.
	}
	else if (LaresGuide_ZumPortal == 6)
	{
		AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_01"); //(irritado) Sí, sí.
	};

	AI_Output	(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_02"); //En marcha.
	
	if (LaresGuide_ZumPortal == 7)
	{
		AI_Output	(self, other, "DIA_Addon_Lares_PortalInterWEITER_09_03"); //Apártate un poco.
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Lares_PortalInterWEITER_09_04"); //No te despegues de mí.
	};
		
	AI_StopProcessInfos (self);

	if (LaresGuide_ZumPortal == 2)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL2");
	}
	else if	(LaresGuide_ZumPortal == 3)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL3");
	}
	else if	(LaresGuide_ZumPortal == 4)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL4");
	}
	else if	(LaresGuide_ZumPortal == 5)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL5");
	}
	else if	(LaresGuide_ZumPortal == 6)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPEL6");
	}
	else if	(LaresGuide_ZumPortal == 7)
	{
		Npc_ExchangeRoutine (self,"GUIDEPORTALTEMPELEND");
	};
};

// ************************************************************
// 			  				  LEHRER
// ************************************************************
// ------------------------------------------------------------
// Wanna Learn
// ------------------------------------------------------------
instance DIA_Lares_DEX		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	20;
	condition	 = 	DIA_Lares_DEX_Condition;
	information	 = 	DIA_Lares_DEX_Info;
	permanent 	 =  FALSE;
	description	 = 	"¿Puedes enseñarme algo?";
};
func int DIA_Lares_DEX_Condition ()
{	
	return TRUE;
};
func void DIA_Lares_DEX_Info ()
{
	AI_Output (other, self, "DIA_Lares_DEX_15_00"); //¿Puedes enseñarme algo?
	AI_Output (self, other, "DIA_Addon_Lares_DEX_Add_09_01"); //Claro. Si quieres puedo enseñarte a ser más fuerte y más diestro.

	Lares_TeachDEX = TRUE;
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Lares puede ayudarme a fortalecerme y a ser más diestro.");
};
// ------------------------------------------------------------
// 			  				   TEACH 
// ------------------------------------------------------------
var int Lares_MerkeDEX;
var int Lares_MerkeSTR;
//-----------------------------------
instance DIA_Lares_TEACH		(C_INFO)
{
	npc		  	 = 	VLK_449_Lares;
	nr			 = 	20;
	condition	 = 	DIA_Lares_TEACH_Condition;
	information	 = 	DIA_Lares_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Enséñame algo.";
};
func int DIA_Lares_TEACH_Condition ()
{	
	if (Lares_TeachDEX == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lares_TEACH_Info ()
{
	//AI_Output (other, self, "DIA_Lares_TEACH_15_00"); //Ich will geschickter werden!
	AI_Output (other,self ,"DIA_Addon_Lares_Teach_15_00"); //Enséñame algo.
	
	Lares_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Lares_MerkeSTR = other.attribute[ATR_STRENGTH];
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};
func void DIA_Lares_TEACH_BACK()
{
	if (other.attribute[ATR_DEXTERITY] > Lares_MerkeDEX)
	{
		AI_Output (self, other, "DIA_Lares_TEACH_BACK_09_00"); //Ya te has hecho más diestro.
	};
	if (other.attribute[ATR_STRENGTH] > Lares_MerkeSTR)
	{
		AI_Output (self, other, "DIA_Addon_Lares_TEACH_BACK_Add_09_00"); //(evaluando) Bien. Tu fuerza ha mejorado.
	};
	
	Info_ClearChoices (DIA_Lares_TEACH);
};
func void DIA_Lares_TEACH_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};
func void DIA_Lares_TEACH_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};
func void DIA_Lares_TEACHSTR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_LOW);
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};
func void DIA_Lares_TEACHSTR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_LOW);
	
	Info_ClearChoices   (DIA_Lares_TEACH);
	Info_AddChoice 		(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Lares_TEACH_5);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice		(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Lares_TEACHSTR_5);
};


//#################################
//##
//##	Kapitel 2
//##
//#################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap2_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap2_EXIT_Condition;
	information	= DIA_Lares_Kap2_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#################################
//##
//##	Kapitel 3
//##
//#################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap3_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap3_EXIT_Condition;
	information	= DIA_Lares_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 		Gibt's was Neues?			 
// ************************************************************
INSTANCE DIA_Lares_AnyNews(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 5;
	condition	= DIA_Lares_AnyNews_Condition;
	information	= DIA_Lares_AnyNews_Info;
	permanent	= TRUE;
	description = "¿Alguna novedad?";
};                       
FUNC INT DIA_Lares_AnyNews_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Lares_AnyNews_15_00"); //¿Alguna novedad?
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_01"); //Tú mismo eres el responsable de las mejores noticias. Han dejado salir a Bennet otra vez. Está de vuelta en la granja.
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_02"); //Ve a verle, creo que le gustaría agradecértelo personalmente.
	}
	else
	{
		AI_Output (self ,other,"DIA_Lares_AnyNews_09_03"); //Podrías decirlo así. Los paladines han arrestado a Bennet, nuestro herrero.
		
		if (MIS_RescueBennet == LOG_RUNNING)
		{
			AI_Output (other,self ,"DIA_Lares_AnyNews_15_04"); //Eso he oído. Es un asunto turbio.
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_05"); //Puedes volver a decir eso.
		}
		else
		{
			AI_Output (other,self ,"DIA_Lares_AnyNews_15_06"); //¿Cómo ocurrió?
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_07"); //Bennet fue a la ciudad a comprar suministros. Y bueno, nunca regresó.
			AI_Output (self ,other,"DIA_Lares_AnyNews_09_08"); //Si quieres saber más, deberías preguntar a Hodges. Estaba en la ciudad con Bennet.
			
			MIS_RescueBennet = LOG_RUNNING;
		};
	};
};

// ************************************************************
// 		Hast du was von Bennet gehört?			 
// ************************************************************
INSTANCE DIA_Lares_NewsAboutBennet(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 6;
	condition	= DIA_Lares_NewsAboutBennet_Condition;
	information	= DIA_Lares_NewsAboutBennet_Info;
	permanent	= FALSE;
	description = "¿Alguna noticia de Bennet?";
};                       
FUNC INT DIA_Lares_NewsAboutBennet_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_NewsAboutBennet_Info()
{	
	AI_Output (other,self ,"DIA_Lares_NewsAboutBennet_15_00"); //¿Alguna noticia de Bennet?
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_01"); //Parece que lo han llevado a los barracones y lo han encerrado en el calabozo.
	AI_Output (other,self ,"DIA_Lares_NewsAboutBennet_15_02"); //¿Cómo podemos sacarlo de allí?
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_03"); //De momento no se me ocurre nada. No puedo ir a su celda a hablar con él.
	AI_Output (self ,other,"DIA_Lares_NewsAboutBennet_09_04"); //Lo único que puedo hacer es mantenerme atento, pero no hay mucho de lo que enterarse por aquí.
};

//#################################
//##
//##	Kapitel 4
//##
//#################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap4_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap4_EXIT_Condition;
	information	= DIA_Lares_Kap4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//****************************************
//	Wieso bist du nicht auf Drachenjagd?
//****************************************

INSTANCE DIA_Lares_Kap4_PERM(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 6;
	condition	= DIA_Lares_Kap4_PERM_Condition;
	information	= DIA_Lares_Kap4_PERM_Info;
	permanent	= TRUE;
	description = "¿Por qué no estás cazando dragones?";
};                       
FUNC INT DIA_Lares_Kap4_PERM_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap4_PERM_Info()
{	
	AI_Output (other,self ,"DIA_Lares_Kap4_PERM_15_00"); //¿Por qué no estás cazando dragones?
	AI_Output (self ,other,"DIA_Lares_Kap4_PERM_09_01"); //No es lo mío. Que lo hagan otros.
	AI_Output (self ,other,"DIA_Lares_Kap4_PERM_09_02"); //No, no. Aire fresco del mar: eso es lo que necesito ahora.
};

//#################################
//##
//##	Kapitel 5
//##
//#################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lares_Kap5_EXIT(C_INFO)
{
	npc			= VLK_449_Lares;
	nr			= 999;
	condition	= DIA_Lares_Kap5_EXIT_Condition;
	information	= DIA_Lares_Kap5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lares_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lares_Kap5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//****************************************************************
//	Lares anheuern
//****************************************************************

///////////////////////////////////////////////////////////////////////
//	Hast du Lust diese Insel zu verlassen?
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Lares_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lares_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"¿Te interesaría salir de esta isla?";
};
func int DIA_Lares_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lares_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lares_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_00"); //¿Te apetecería salir de esta isla?
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_01"); //Más que nada. ¿Qué tienes en mente?
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_02"); //Encontré dónde se oculta el líder de los dragones. Está en una isla, no muy lejos de aquí.
	AI_Output			(other, self, "DIA_Lares_KnowWhereEnemy_15_03"); //Pretendo librarme de él de una vez por todas.
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_04"); //Suena divertido. Si te sirvo de algo, quiero ir.
	AI_Output			(self, other, "DIA_Lares_KnowWhereEnemy_09_05"); //¿No te vendría bien en tu viaje un profesor de destreza o combate con armas de una mano?
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lares_KnowWhereEnemy_15_06"); //El barco ya está lleno, pero te vendré a buscar si hay algún cambio.
	}
	else 
	{
		Info_ClearChoices (DIA_Lares_KnowWhereEnemy);
		Info_AddChoice (DIA_Lares_KnowWhereEnemy,"No te necesito.",DIA_Lares_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lares_KnowWhereEnemy,"Sabía que podía confiar en ti.",DIA_Lares_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lares_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_Yes_15_00"); //Sabía que podía confiar en ti.
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_Yes_15_01"); //Nos encontraremos todos en el barco.
	AI_Output (self ,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02"); //Un hombre de acción, así me gusta. Te veré luego.
	
	Lares_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Lares_KnowWhereEnemy);
};

FUNC VOID DIA_Lares_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lares_KnowWhereEnemy_No_15_00"); //Aprecio tu oferta, pero no me sirves de nada.
	AI_Output (self ,other,"DIA_Lares_KnowWhereEnemy_No_09_01"); //Tú sabrás lo que quieres. Si deseas hablar de ello en otro momento, ya sabes dónde encontrarme.

	if (hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard	 = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard	 = LOG_FAILED;
	};	
	Info_ClearChoices (DIA_Lares_KnowWhereEnemy);
};


///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_LeaveMyShip		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Lares_LeaveMyShip_Condition;
	information	 = 	DIA_Lares_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Es mejor que no vengas.";
};
func int DIA_Lares_LeaveMyShip_Condition ()
{	
	if (Lares_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lares_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lares_LeaveMyShip_15_00"); //Es mejor que no vengas.
	AI_Output			(self, other, "DIA_Lares_LeaveMyShip_09_01"); //Como quieras pero, en el futuro, piensa en lo que prometes y a quién.
	
	if (hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard	 = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard	 = LOG_FAILED;
	};				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_StillNeedYou		(C_INFO)
{
	npc			 = 	VLK_449_Lares;
	nr			 = 	5;
	condition	 = 	DIA_Lares_StillNeedYou_Condition;
	information	 = 	DIA_Lares_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"¿Sigues interesado en el viaje?";
};
func int DIA_Lares_StillNeedYou_Condition ()
{	
	if ((Lares_IsOnBOard == LOG_OBSOLETE)		
	|| (Lares_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lares_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lares_StillNeedYou_15_00"); //¿Sigues interesado en el viaje?
	
	if (Lares_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_01"); //Normalmente no dejo que nadie me trate así pero, dado que eres uno de los nuestros, te dejaré que te salgas con la tuya por esta vez.
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_02"); //Nos encontraremos en el barco.
		
		Lares_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
	
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	}
	else
	{
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_03"); //No te lo tomes personalmente, pero creo que tenías razón.
		AI_Output	(self, other, "DIA_Lares_StillNeedYou_09_04"); //Es mejor que me quede aquí.
		
		AI_StopProcessInfos (self);
	};	
};


























