// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_SLD_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_SLD_7_EXIT_Condition;
	information	= DIA_SLD_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_SLD_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_SLD_7_JOIN_Condition;
	information	= DIA_SLD_7_JOIN_Info;
	permanent	= TRUE;
	description = "¡Quiero unirme a vosotros!";
};                       

FUNC INT DIA_SLD_7_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_JOIN_15_00"); //¡Quiero unirme a vosotros!
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_01"); //Tengo entendido que le diste una buena a la milicia. ¡Nos vendría bien alguien como tú!
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_02"); //Me parece que cobrar la renta a unos cuantos granjeros no es nada complicado, pero si Onar quiere pagarte, por mí estupendo.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_03"); //¿Tú? En cuanto Torlof te ponga a prueba estás arreglado, listillo.
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_SLD_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_SLD_7_PEOPLE_Condition;
	information	= DIA_SLD_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "¿Quién está al mando?";
};                       

FUNC INT DIA_SLD_7_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_PEOPLE_15_00"); //¿Quién está al mando?
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_01"); //Lee es nuestro jefe y Torlof su mano derecha. La mayoría de los hombres lo siguen porque fue su líder en la colonia.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_02"); //Y luego está Sylvio. Bajó de las montañas con sus hombres después de la llegada de Lee.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_03"); //Su gente y él solo son una pequeña parte de los mercenarios, pero causan bastantes problemas. Esos tipos van a lo suyo.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_04"); //Y Sylvio es un hijo de mala madre, así que ten cuidado cuando lo veas.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_SLD_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_SLD_7_LOCATION_Condition;
	information	= DIA_SLD_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Háblame de la granja.";
};                       

FUNC INT DIA_SLD_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_LOCATION_15_00"); //Háblame de la granja.
	AI_Output (self, other, "DIA_SLD_7_LOCATION_07_01"); //Onar nos contrató para que vigiláramos sus posesiones.
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_SLD_7_LOCATION_07_02"); //Como se te ocurra robar algo o dar una paliza a los granjeros, te las verás con nosotros, ¿te enteras?
	};
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_SLD_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_SLD_7_STANDARD_Condition;
	information	= DIA_SLD_7_STANDARD_Info;
	permanent	= TRUE;
	description = "¿Qué hay de nuevo?";
};                       
func INT DIA_SLD_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_SLD_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_STANDARD_15_00"); //¿Qué hay de nuevo?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_01"); //Desde que te uniste a nosotros, la granja ha estado tranquila. No hay rastro de la milicia.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_02"); //Aquí casi nada, pero pregunta en la ciudad. Creo que se están quedando sin manduca. (Se ríe)
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_03"); //¡Dragones en el Valle de las Minas! No me gustaría estar en el lugar de los paladines.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_04"); //Supongo que el rey le dará a lord Hagen una buena patada en el culo cuando vuelva con las manos vacías por culpa de los dragones.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_05"); //¿Los paladines no podéis con los dragones? No me extraña. Al fin y al cabo, combatir es para hombres de verdad.
			};
		};	
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_06"); //Resolviste muy bien el asunto de Bennet. Sylvio está que rabia. Habría preferido asaltar la ciudad y destrozarlo todo.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_07"); //Siempre intenta que Lee adopte una postura defensiva y Bennet era una buena excusa.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_08"); //No sé por qué ayudaste a Bennet, pero te juro que fue lo mejor para la ciudad.
			};
		}
		else
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_09"); //Menudo lío lo de Bennet. A lo mejor deberíamos hacer caso a Sylvio y atacar la ciudad.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_10"); //¿Qué tienes pensado hacer con Bennet? Bueno, no quiero saberlo. No vas a tardar en ver las consecuencias.
			};
		};		
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_11"); //Creía que tú también te ibas al valle con Sylvio.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_12"); //A ninguno de nosotros le importaría que Sylvio se quedase en el valle... ¡para siempre!
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_13"); //Has demostrado valentía al aparecer aquí a solas.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_14"); //Pero me da igual, mientras no intentes recaudar impuestos.
		};
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_SLD_7_STANDARD_07_15"); //Tío, no aguanto más. Ovejas, pastos y árboles. Quiero salir de aquí de una vez.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SLD_7 (var c_NPC slf)
{
	DIA_SLD_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
