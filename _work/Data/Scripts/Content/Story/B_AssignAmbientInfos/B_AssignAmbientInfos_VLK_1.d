// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_1_EXIT_Condition;
	information	= DIA_VLK_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_1_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_1_JOIN_Condition;
	information	= DIA_VLK_1_JOIN_Info;
	permanent	= TRUE;
	description = "�C�mo puedo convertirme en ciudadano?";
};                       

FUNC INT DIA_VLK_1_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_1_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_JOIN_15_00"); //�C�mo puedo convertirme en ciudadano?
	AI_Output (self, other, "DIA_VLK_1_JOIN_01_01"); //�B�scate un trabajo honrado! Todo el que tiene un empleo fijo es ciudadano de Khorinis.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_1_PEOPLE_Condition;
	information	= DIA_VLK_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "�Qui�nes son las personalidades?";
};                       

FUNC INT DIA_VLK_1_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_PEOPLE_15_00"); //�Qui�nes son las personalidades?
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_01"); //(Se r�e) Hasta hace poco el gobernador y el juez, pero desde que llegaron los paladines, tomaron el control de la ciudad.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_02"); //Lord Hagen es su l�der. Es el nuevo gobernador, m�s o menos.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_03"); //Lord Andre es su mano derecha. Dirige la guardia de la ciudad y tambi�n hace las veces de juez.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_04"); //En la ciudad, todo el que sea culpable de algo tiene que responder ante �l.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_1_LOCATION_Condition;
	information	= DIA_VLK_1_LOCATION_Info;
	permanent	= TRUE;
	description = "�Qu� hay interesante en la ciudad?";
};                       

FUNC INT DIA_VLK_1_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_LOCATION_15_00"); //�Qu� hay interesante en la ciudad?
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_01"); //Aqu� puedes comprar todo lo que se te pase por la imaginaci�n, en la parte baja de la ciudad o a los comerciantes del mercado.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_02"); //Pero casi todo es bastante caro.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_03"); //Si no tienes bastante dinero, tal vez pueda ayudarte el prestamista Lehmar. Su casa est� al principio del distrito portuario seg�n vas desde la parte baja de la ciudad.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_1_STANDARD_Condition;
	information	= DIA_VLK_1_STANDARD_Info;
	permanent	= TRUE;
	description = "�Qu� hay de nuevo?";
};                       
func INT DIA_VLK_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_STANDARD_15_00"); //�Qu� hay de nuevo?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_01"); //Desde el colapso de la barrera, se ha interrumpido de manera brusca el comercio con el terrateniente. A saber lo que planea. Para m� que hay gato encerrado.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_02"); //Onar se est� pasando .No abastece a la ciudad y, si la milicia no interviene enseguida, los dem�s granjeros no tardar�n en hacer lo que les d� la gana.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_03"); //He o�do que los bandidos han hecho causa com�n con unos magos poderosos de t�nicas negras. Jurar�a que anoche vi uno en la ciudad.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_04"); //He o�do que algunos de los mercenarios de Onar han ido a matar a los dragones. �Por fin hacen algo �til!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_05"); //�Se dice que los dragones han sido derrotados! Lord Hagen ha movilizado a sus hombres para expulsar a las dem�s criaturas del Valle de las Minas.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_1 (var c_NPC slf)
{
	DIA_VLK_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_1_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_1_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
