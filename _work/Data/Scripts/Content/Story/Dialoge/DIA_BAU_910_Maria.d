// ************************************************************
// 								EXIT
// ************************************************************
INSTANCE DIA_Maria_EXIT   (C_INFO)
{
	npc         = BAU_910_Maria;
	nr          = 999;
	condition   = DIA_Maria_EXIT_Condition;
	information = DIA_Maria_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Maria_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Maria_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Maria_Hallo		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 1;
	condition	= DIA_Maria_Hallo_Condition;
	information	= DIA_Maria_Hallo_Info;
	permanent  	= FALSE;
	description = "¿Quién eres tú?";
};

func int DIA_Maria_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Maria_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Maria_Hallo_15_00"); //¿Quién eres tú?
	AI_Output (self, other, "DIA_Maria_Hallo_17_01"); //Soy la esposa de Onar, María.
	AI_Output (self, other, "DIA_Maria_Hallo_17_02"); //¿Qué quieres?
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Umsehen		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 2;
	condition	= DIA_Maria_Umsehen_Condition;
	information	= DIA_Maria_Umsehen_Info;
	permanent  	= FALSE;
	description = "Solo quería echar un vistazo...";
};

func int DIA_Maria_Umsehen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_Umsehen_Info ()
{
	AI_Output (other, self, "DIA_Maria_Umsehen_15_00"); //Solo quería echar un vistazo...
	AI_Output (self, other, "DIA_Maria_Umsehen_17_01"); //Con todos estos hombres en la granja, no hay un momento de paz dentro de la casa.
	AI_Output (self, other, "DIA_Maria_Umsehen_17_02"); //No hacen más que entrar y salir.
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Soeldner	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 3;
	condition	= DIA_Maria_Soeldner_Condition;
	information	= DIA_Maria_Soeldner_Info;
	permanent  	= FALSE;
	description = "¿Los mercenarios te molestan?";
};

func int DIA_Maria_Soeldner_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Umsehen))
	{
		return TRUE;
	};
};

func void DIA_Maria_Soeldner_Info ()
{
	AI_Output (other, self, "DIA_Maria_Soeldner_15_00"); //¿Los mercenarios te molestan?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_01"); //Bueno, olvídate de lo que te acabo de contar. Desde que aparecisteis, vivimos mucho más seguros.
		}
	else
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_02"); //Bueno, por lo menos la granja es más segura desde la llegada de los mercenarios.
		};

	AI_Output (self, other, "DIA_Maria_Soeldner_17_03"); //Cuando estábamos solos, la milicia de la ciudad venía cuando quería a saquear nuestras provisiones.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_04"); //Se llevaban casi toda la cosecha y también algunas ovejas. A cambio no nos daban nada.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_05"); //Unos cuantos de esos granujas también nos robaban.
	if (hero.guild == GIL_MIL)
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_06"); //No me malinterpretes, soldado. Sé que no todos sois iguales.
		};	
};

// ************************************************************
// 							Mission
// ************************************************************
instance DIA_Maria_Mission	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 4;
	condition	= DIA_Maria_Mission_Condition;
	information	= DIA_Maria_Mission_Info;
	permanent  	= FALSE;
	description = "¿Qué os robaron?";
};

func int DIA_Maria_Mission_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Soeldner))
	&& (MIS_Maria_BringPlate != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Maria_Mission_Info ()
{
	AI_Output (other, self, "DIA_Maria_Mission_15_00"); //¿Qué os robaron?
	AI_Output (self, other, "DIA_Maria_Mission_17_01"); //Sobre todo oro y plata. También se llevaron mi regalo de boda, un plato de oro.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Maria_Mission_17_02"); //Supongo que ahora estará acumulando polvo en el arcón de algún asqueroso guardia de la ciudad.
	};
	MIS_Maria_BringPlate = LOG_RUNNING;
};

// ************************************************************
// 							BringPlate
// ************************************************************
instance DIA_Maria_BringPlate	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 5;
	condition	= DIA_Maria_BringPlate_Condition;
	information	= DIA_Maria_BringPlate_Info;
	permanent  	= FALSE;
	description = "Aquí tengo un plato de oro. ¿Es el tuyo?";
};

func int DIA_Maria_BringPlate_Condition ()
{
	if (Npc_HasItems (other, ItMi_MariasGoldPlate) > 0)
	{
		return TRUE;
	};
};

func void DIA_Maria_BringPlate_Info ()
{
	B_GiveInvItems (other, self, ItMi_MariasGoldPlate, 1);
	AI_Output (other, self, "DIA_Maria_BringPlate_15_00"); //Aquí tengo un plato de oro. ¿Es el tuyo?
	AI_Output (self, other, "DIA_Maria_BringPlate_17_01"); //¡Sí! ¡Es ése! ¡Un millón de gracias!
	
	MIS_Maria_BringPlate = LOG_SUCCESS;
	B_GivePlayerXP (XP_Maria_Teller);
};


// ************************************************************
// 							BringPlate
// ************************************************************
var int Maria_Belohnung;
// ---------------------

instance DIA_Maria_Belohnung	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 6;
	condition	= DIA_Maria_Belohnung_Condition;
	information	= DIA_Maria_Belohnung_Info;
	permanent  	= TRUE;
	description = "¿Qué hay de mi recompensa?";
};

func int DIA_Maria_Belohnung_Condition ()
{
	if (MIS_Maria_BringPlate == LOG_SUCCESS)
	&& (Maria_Belohnung == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Maria_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_15_00"); //¿Qué hay de mi recompensa?
	
	
	if (other.guild == GIL_SLD)
	|| (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_01"); //¿No trabajas para mi marido como mercenario?
		AI_Output (other, self, "DIA_Maria_Belohnung_15_02"); //Sí.
		AI_Output (self, other, "DIA_Maria_Belohnung_17_03"); //¿Cuánto te paga mi marido?
		B_Say_Gold (other, self, SOLD);
		AI_Output (self, other, "DIA_Maria_Belohnung_17_04"); //No es suficiente. Ve a decirle que te pague más.
		AI_Output (other, self, "DIA_Maria_Belohnung_15_05"); //¿Y crees que va a aceptar?
		AI_Output (self, other, "DIA_Maria_Belohnung_17_06"); //Sabe bien lo que pasará si no lo hace. Créeme.
		Maria_MehrGold = TRUE;
		Maria_Belohnung = TRUE;
	}
	else if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_07"); //¿Quieres contratarme como mercenario en la granja?
		Info_ClearChoices (DIA_Maria_Belohnung);
		Info_AddChoice (DIA_Maria_Belohnung, "No, de verdad.", DIA_Maria_Belohnung_Gold);
		Info_AddChoice (DIA_Maria_Belohnung, "Sí.", DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		B_GiveInvItems (self, other, itmi_gold, 50);
		Maria_Belohnung = TRUE;
		AI_Output (self, other, "DIA_Maria_Belohnung_17_08"); //Ten, toma. Te lo mereces.
	};
};

func void DIA_Maria_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_Gold_15_00"); //No, de verdad.
	B_GiveInvItems (self, other, itmi_gold, 50);
	Maria_Belohnung = TRUE;
	AI_Output (self, other, "DIA_Maria_Belohnung_Gold_17_01"); //Entonces quédate este oro a modo de recompensa. Te lo has ganado.
	Info_ClearChoices (DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_SOLD_15_00"); //Sí.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_01"); //Muy bien. Si trabajas aquí, me aseguraré de que te paguen un sueldo decente.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_02"); //Vuelve cuando hayas negociado la paga con mi marido.
	Info_ClearChoices (DIA_Maria_Belohnung);
};
		
// ************************************************************
// 							AboutOnar
// ************************************************************
instance DIA_Maria_AboutOnar	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 7;
	condition	= DIA_Maria_AboutOnar_Condition;
	information	= DIA_Maria_AboutOnar_Info;
	permanent  	= FALSE;
	description = "Háblame de Onar.";
};

func int DIA_Maria_AboutOnar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_AboutOnar_Info ()
{
	AI_Output (other, self, "DIA_Maria_AboutOnar_15_00"); //Háblame de Onar.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_01"); //Es buena persona. Algo gruñón y un poco impaciente, pero todos tenemos defectos.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_02"); //Le pregunté a mi marido que por qué dejaba que los soldados de la ciudad le trataran así.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_03"); //Le dije que hiciera algo.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_04"); //Contrató a los mercenarios, y me siento como si estuviera en medio de una guerra.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_05"); //Bueno, lo cierto es que estamos en guerra, ¿no?
};

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Maria_PERM	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 8;
	condition	= DIA_Maria_PERM_Condition;
	information	= DIA_Maria_PERM_Info;
	permanent  	= FALSE;
	description = "¿Ha sucedido algo emocionante últimamente?";
};

func int DIA_Maria_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_PERM_Info ()
{
	AI_Output (other, self, "DIA_Maria_PERM_15_00"); //¿Ha sucedido algo emocionante últimamente?
	if (Kapitel <= 2)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_01"); //Los paladines pasaron por aquí.
		AI_Output (self, other, "DIA_Maria_PERM_17_02"); //Al principio creímos que iban a atacar la granja, pero se dirigían al Valle de las Minas.
	}
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_03"); //Wasili persiguió a un ladrón hace unas cuantas noches. Aparte de eso, todo ha estado tranquilo.
	};
	
	if (Kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_04"); //Desde que se fueron algunos mercenarios, todo ha estado mucho más tranquilo.
	};
};
			

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Maria_PICKPOCKET (C_INFO)
{
	npc			= BAU_910_Maria;
	nr			= 900;
	condition	= DIA_Maria_PICKPOCKET_Condition;
	information	= DIA_Maria_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Maria_PICKPOCKET_Condition()
{
	C_Beklauen (60, 110);
};
 
FUNC VOID DIA_Maria_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Maria_PICKPOCKET);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_BACK 		,DIA_Maria_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Maria_PICKPOCKET_DoIt);
};

func void DIA_Maria_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};
	
func void DIA_Maria_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};


			
			
			
			



	















