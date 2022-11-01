///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Engrom_EXIT   (C_INFO)
{
	npc         = VLK_4131_Engrom;
	nr          = 999;
	condition   = DIA_Engrom_EXIT_Condition;
	information = DIA_Engrom_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Engrom_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Engrom_EXIT_Info()
{
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_HALLO		(C_INFO)
{
	npc		 = 	VLK_4131_Engrom;
	nr          = 5;
	condition	 = 	DIA_Engrom_HALLO_Condition;
	information	 = 	DIA_Engrom_HALLO_Info;

	description	 = 	"¿Qué pasa?";
};

func int DIA_Engrom_HALLO_Condition ()
{
	if (Kapitel <= 3)
		{
				return TRUE;
		};
};

func void DIA_Engrom_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Engrom_HALLO_15_00"); //¿Cómo va todo?
	AI_Output			(self, other, "DIA_Engrom_HALLO_12_01"); //¡Fatal!
	AI_Output			(other, self, "DIA_Engrom_HALLO_15_02"); //¡Uff!
	AI_Output			(self, other, "DIA_Engrom_HALLO_12_03"); //Qué más debería decir. No he hecho más que subir y bajar por este maldito río durante días.
	AI_Output			(self, other, "DIA_Engrom_HALLO_12_04"); //Orcos escondidos a la izquierda, bandidos merodeando por la derecha y todos los días como carne de merodeador. No puedo soportarlo más.
};

///////////////////////////////////////////////////////////////////////
//	Info WhatAboutLeaving
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_WhatAboutLeaving		(C_INFO)
{
	npc		 = 	VLK_4131_Engrom;
	nr          = 6;
	condition	 = 	DIA_Engrom_WhatAboutLeaving_Condition;
	information	 = 	DIA_Engrom_WhatAboutLeaving_Info;

	description	 = 	"¿Has pensado alguna vez en salir de aquí?";
};

func int DIA_Engrom_WhatAboutLeaving_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Engrom_HALLO))
	&& (Kapitel <= 3)
		{
				return TRUE;
		};
};

func void DIA_Engrom_WhatAboutLeaving_Info ()
{
	AI_Output			(other, self, "DIA_Engrom_WhatAboutLeaving_15_00"); //¿Has pensado alguna vez en salir de aquí?
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_01"); //Ya, claro. Cómo no.
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_02"); //Primero me abriré paso entre las hordas de orcos, saludaré a todos los monstruos que me encuentre por el camino, ¡y luego atravesaré el paso dando un paseíto!
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_03"); //¡Sería todo un espectáculo!
	AI_Output			(other, self, "DIA_Engrom_WhatAboutLeaving_15_04"); //Yo también he entrado.
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_05"); //¿Intentas decirme que acabas de atravesar el paso?
	AI_Output			(other, self, "DIA_Engrom_WhatAboutLeaving_15_06"); //Más o menos, ¡sí!
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_07"); //Pues has tenido suerte. Mientras las cosas sigan tan chungas por aquí, no pienso moverme.

};

///////////////////////////////////////////////////////////////////////
//	Info Jagd
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_Jagd		(C_INFO)
{
	npc		 = 	VLK_4131_Engrom;
	nr          = 6;
	condition	 = 	DIA_Engrom_Jagd_Condition;
	information	 = 	DIA_Engrom_Jagd_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Qué tal va la caza?";
};

func int DIA_Engrom_Jagd_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Engrom_HALLO))
	&& (Kapitel <= 3)
		{
				return TRUE;
		};
};

func void DIA_Engrom_Jagd_Info ()
{
	B_WasMachtJagd ();
	//Joly:AI_Output			(other, self, "DIA_Engrom_Jagd_15_00"); //Schon mal dran gedacht, hier abzuhauen?
	AI_Output			(self, other, "DIA_Engrom_Jagd_12_01"); //Cazar es mi único consuelo. Pero me gustaría ver una pieza de vez en cuando que no fuera esos asquerosos merodeadores.
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Engrom_KAP3_EXIT(C_INFO)
{
	npc			= VLK_4131_Engrom;
	nr			= 999;
	condition	= DIA_Engrom_KAP3_EXIT_Condition;
	information	= DIA_Engrom_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Engrom_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Engrom_KAP3_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Engrom_KAP4_EXIT(C_INFO)
{
	npc			= VLK_4131_Engrom;
	nr			= 999;
	condition	= DIA_Engrom_KAP4_EXIT_Condition;
	information	= DIA_Engrom_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Engrom_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Engrom_KAP4_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_B_NpcObsessedByDMT		(C_INFO)
{
	npc		 = 	VLK_4131_Engrom;
	nr		 = 	32;
	condition	 = 	DIA_Engrom_B_NpcObsessedByDMT_Condition;
	information	 = 	DIA_Engrom_B_NpcObsessedByDMT_Info;

	description	 = 	"¿Va todo bien?";
};

func int DIA_Engrom_B_NpcObsessedByDMT_Condition ()
{
	if (NpcObsessedByDMT_Engrom == FALSE)
	&& (Kapitel >= 4)	
	 {
				return TRUE;
	 };
};

func void DIA_Engrom_B_NpcObsessedByDMT_Info ()
{
	MIS_Tabin_LookForEngrom = LOG_SUCCESS;
	B_NpcObsessedByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info bessen
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_BESSEN		(C_INFO)
{
	npc		 = 	VLK_4131_Engrom;
	nr		 = 	55;
	condition	 = 	DIA_Engrom_BESSEN_Condition;
	information	 = 	DIA_Engrom_BESSEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"El mal se ha apoderado de ti.";
};

func int DIA_Engrom_BESSEN_Condition ()
{
 	if (NpcObsessedByDMT_Engrom == TRUE)
 	&& (NpcObsessedByDMT == FALSE)
	&& (Kapitel >= 4)	
	 {
				return TRUE;
	 };
};

func void DIA_Engrom_BESSEN_Info ()
{
	AI_Output			(other, self, "DIA_Engrom_BESSEN_15_00"); //El mal se ha apoderado de ti.

	AI_Output			(other, self, "DIA_Engrom_BESSEN_15_01"); //Déjame ayudarte.
	AI_Output			(self, other, "DIA_Engrom_BESSEN_12_02"); //(Grita) ¡No me toques!

	B_NpcClearObsessionByDMT (self);
		
	Npc_SetTarget 		(self, other);
	
	self.aivar[AIV_INVINCIBLE] = FALSE; //HACK, weil durch AI_StartState (böse) Flag nicht zurückgesetzt wird 
	other.aivar[AIV_INVINCIBLE] = FALSE;
			
	AI_StartState 		(self, ZS_Flee, 0, "");	
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Engrom_KAP5_EXIT(C_INFO)
{
	npc			= VLK_4131_Engrom;
	nr			= 999;
	condition	= DIA_Engrom_KAP5_EXIT_Condition;
	information	= DIA_Engrom_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Engrom_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Engrom_KAP5_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Engrom_KAP6_EXIT(C_INFO)
{
	npc			= VLK_4131_Engrom;
	nr			= 999;
	condition	= DIA_Engrom_KAP6_EXIT_Condition;
	information	= DIA_Engrom_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Engrom_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Engrom_KAP6_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Engrom_PICKPOCKET (C_INFO)
{
	npc			= VLK_4131_Engrom;
	nr			= 900;
	condition	= DIA_Engrom_PICKPOCKET_Condition;
	information	= DIA_Engrom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Engrom_PICKPOCKET_Condition()
{
	C_Beklauen (10, 5);
};
 
FUNC VOID DIA_Engrom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Engrom_PICKPOCKET);
	Info_AddChoice		(DIA_Engrom_PICKPOCKET, DIALOG_BACK 		,DIA_Engrom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Engrom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Engrom_PICKPOCKET_DoIt);
};

func void DIA_Engrom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Engrom_PICKPOCKET);
};
	
func void DIA_Engrom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Engrom_PICKPOCKET);
};


