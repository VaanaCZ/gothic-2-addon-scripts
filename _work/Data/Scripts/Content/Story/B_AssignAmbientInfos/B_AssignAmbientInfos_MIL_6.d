// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_MIL_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_MIL_6_EXIT_Condition;
	information	= DIA_MIL_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MIL_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_MIL_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_MIL_6_JOIN_Condition;
	information	= DIA_MIL_6_JOIN_Info;
	permanent	= TRUE;
	description = "�Qu� tengo que hacer para alistarme en la milicia?";
};                       

FUNC INT DIA_MIL_6_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_MIL_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_JOIN_15_00"); //�Qu� tengo que hacer para alistarme en la milicia?
	AI_Output (self, other, "DIA_MIL_6_JOIN_06_01"); //Ve a hablar con lord Andre. Desde que llegaron los paladines a la ciudad, est� al mando de toda la milicia.
	if (C_NpcIsInQuarter (self) != Q_KASERNE)
	{
		AI_Output (self, other, "DIA_MIL_6_JOIN_06_02"); //Lo encontrar�s en el cuartel. Se tira all� casi todo el d�a.
	};
};

// *************************************************************************
// 						MissingPeople
// *************************************************************************
instance DIA_Addon_MIL_6_MissingPeople		(C_INFO)
{
	nr		 = 	2;
	condition	 = 	DIA_Addon_MIL_6_MissingPeople_Condition;
	information	 = 	DIA_Addon_MIL_6_MissingPeople_Info;
	permanent	= TRUE;
	description	 = 	"He o�do que algunos ciudadanos han desaparecido.";
};

func int DIA_Addon_MIL_6_MissingPeople_Condition ()
{
	if (Kapitel == 1)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_MIL_6_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_MIL_6_MissingPeople_15_00"); //He o�do que han desaparecido algunos ciudadanos.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_01"); //La verdad es que �ltimamente he o�do rumores de gente desaparecida.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_02"); //No se me ocurre ninguna explicaci�n.
	AI_Output	(self, other, "DIA_Addon_MIL_6_MissingPeople_06_03"); //Lo �nico que podemos hacer es mantenernos alerta y cumplir como centinelas.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_MIL_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_MIL_6_PEOPLE_Condition;
	information	= DIA_MIL_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "H�blame de los paladines.";
};                       

FUNC INT DIA_MIL_6_PEOPLE_Condition()
{
	IF (hero.guild != GIL_PAL)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MIL_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_PEOPLE_15_00"); //H�blame de los paladines.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_01"); //En cuanto los paladines llegaron a Khorinis, se retiraron a la parte alta de la ciudad.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_02"); //No dejan que nadie entre all�, salvo los ciudadanos y la milicia, por supuesto.
	AI_Output (self, other, "DIA_MIL_6_PEOPLE_06_03"); //Tambi�n hay unos cuantos paladines que vigilan el barco en el puerto, pero no hablan mucho.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_MIL_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_MIL_6_LOCATION_Condition;
	information	= DIA_MIL_6_LOCATION_Info;
	permanent	= TRUE;
	description = "�Qu� hay que saber de la ciudad?";
};                       

FUNC INT DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_LOCATION_15_00"); //�Qu� hay que saber de la ciudad?
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_01"); //Los paladines controlan toda la ciudad y la milicia est� bajo sus �rdenes.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_02"); //Lord Andre es el comandante de la milicia y al mismo tiempo hace las veces de juez.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_03"); //Si alguna vez cometes un delito, te las tendr�s que ver con �l.
	AI_Output (self, other, "DIA_MIL_6_LOCATION_06_04"); //Pero se dice que es bastante indulgente. Por lo general, se limita a imponer multas.
	
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_MIL_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_MIL_6_STANDARD_Condition;
	information	= DIA_MIL_6_STANDARD_Info;
	permanent	= TRUE;
	description = "�Qu� hay de nuevo?";
};                       
func INT DIA_MIL_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_MIL_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_MIL_6_STANDARD_15_00"); //�Qu� hay de nuevo?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_01"); //En la ciudad cada vez hay m�s gentuza.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_02"); //Hay una oleada de robos y lord Andre sospecha que sea obra de una banda.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_03"); //Hace poco pusimos patas arriba el distrito del puerto, pero no encontramos nada.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_04"); //Parece que tenemos m�s o menos controlado el problema de los bandidos. �ltimamente apenas hay asaltos.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_05"); //La cosa va a peor por culpa de toda la chusma que est� llegando a la ciudad. Anoche segu� a un hombre vestido con una t�nica negra por toda la parte alta de la ciudad.
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_06"); //Seguro que no andaba en nada bueno. Pero mientras lo segu�a junto a la casa del gobernador, desapareci� sin m�s. Menudo personaje...
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_07"); //Se dice que lord Hagen ha contratado mercenarios para luchar contra los dragones. Me parece bien, pues no me gustar�a enfrentarme a un drag�n.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_MIL_6_STANDARD_06_08"); //�Se dice que los dragones han sido derrotados! �Lord Hagen est� replegando sus fuerzas para expulsar a las criaturas supervivientes del Valle de las Minas!
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_MIL_6 (var c_NPC slf)
{
	DIA_MIL_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
