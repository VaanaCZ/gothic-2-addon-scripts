// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_SLD_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_SLD_6_EXIT_Condition;
	information	= DIA_SLD_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_SLD_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_SLD_6_JOIN_Condition;
	information	= DIA_SLD_6_JOIN_Info;
	permanent	= TRUE;
	description = "¡Quiero unirme a vosotros!";
};                       

FUNC INT DIA_SLD_6_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_JOIN_15_00"); //¡Quiero unirme a vosotros!
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_01"); //Me he enterado de ese problema con la milicia. Torlof dice que has superado la prueba. Cuenta con mi voto.
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_02"); //Desplumar a los granjeros es una cosa, pero pelearte con la milicia es otra. No obstante, si a Onar le vienes bien, por mí no hay problema.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_03"); //Habla con Torlof. Él te dará las indicaciones pertinentes... (se ríe)
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_SLD_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_SLD_6_PEOPLE_Condition;
	information	= DIA_SLD_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "¿Quién está al mando?";
};                       

FUNC INT DIA_SLD_6_PEOPLE_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_PEOPLE_15_00"); //¿Quién está al mando?
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_01"); //La granja es de Onar, si te refieres a eso, aunque nuestro líder es Lee.
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_02"); //Era general del ejército real, pero ya no es tan amigo del rey (se ríe).
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_03"); //Acuérdate de su nombre. Si te metes en algún lío por aquí, probablemente sea el único que pueda solucionarlo. Los demás se limitarán a despellejarte.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_SLD_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_SLD_6_LOCATION_Condition;
	information	= DIA_SLD_6_LOCATION_Info;
	permanent	= TRUE;
	description = "¿Estáis protegiendo a los granjeros?";
};                       

FUNC INT DIA_SLD_6_LOCATION_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_LOCATION_15_00"); //¿Estáis protegiendo a los granjeros?
	AI_Output (self, other, "DIA_SLD_6_LOCATION_06_01"); //No solo protegemos la granja de Onar, sino todo el valle.
	AI_Output (self, other, "DIA_SLD_6_LOCATION_06_02"); //Onar quiere que tratemos con mano dura a los alborotadores, así que pórtate bien.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_SLD_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_SLD_6_STANDARD_Condition;
	information	= DIA_SLD_6_STANDARD_Info;
	permanent	= TRUE;
	description = "¿Qué pasa?";
};                       
func INT DIA_SLD_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_SLD_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_STANDARD_15_00"); //¿Qué pasa?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_01"); //¡Ya eres uno de los nuestros, chaval!
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_02"); //¿Qué es lo que quieres?
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_03"); //Cuando me enteré de lo de los dragones, al principio no me lo creía.
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_04"); //Un dragón... menuda pelea. Eso sí que es un rival de verdad. Ya estoy harto de ovejas y de milicianos estúpidos.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_05"); //¿Los dragones han hecho que lord Hagen se cague de miedo?
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_06"); //Parece que va a tener que sacar su noble trasero de la ciudad de una vez.
			};
		};	
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_07"); //Lord Hagen puede considerarse afortunado. Si llegan a pasar unos días más, habríamos sacado a Bennet.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_08"); //Si no sueltan pronto a Bennet, vamos a tener que sacarle nosotros.
		};	
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_09"); //¿Qué haces todavía aquí? ¿No te ibas al valle con los otros?
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_10"); //Me da igual si no volvéis ninguno de vosotros.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_11"); //Deberías ir al Valle de las Minas. Tengo entendido que toda ayuda es poca para esos pobres diablos.
		};	
	};
	
	if (Kapitel >= 5)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_12"); //En cuanto apareciste supe que pondrías esto patas arriba.
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_13"); //Pero, ¿dragones? Eso es extraordinario. La gente no va a querer pegarse contigo.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_14"); //Estoy impresionado. Vas por mal camino, aunque matar dragones no es moco de pavo.
		};	
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SLD_6 (var c_NPC slf)
{
	DIA_SLD_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
