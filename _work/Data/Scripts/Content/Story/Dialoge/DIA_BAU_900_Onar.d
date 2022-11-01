// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Onar_EXIT   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 999;
	condition   = DIA_Onar_EXIT_Condition;
	information = DIA_Onar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Onar_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				Hallo 
// ************************************************************
INSTANCE DIA_Onar_Hallo (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 1;
	condition   = DIA_Onar_Hallo_Condition;
	information = DIA_Onar_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Onar_Hallo_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_Hallo_Info()
{
	AI_Output (self, other, "DIA_Onar_Hallo_14_00"); //¡¿Quién te ha dejado entrar?!
	AI_Output (self, other, "DIA_Onar_Hallo_14_01"); //¡¿Qué haces en mi granja?!
};

// ************************************************************
// 			  				PERM 
// ************************************************************
INSTANCE DIA_Onar_PERM (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 1;
	condition   = DIA_Onar_PERM_Condition;
	information = DIA_Onar_PERM_Info;
	permanent   = TRUE;
	description = "¿Va todo bien en la granja?";
};
FUNC INT DIA_Onar_PERM_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_PERM_Info()
{
	AI_Output (other, self, "DIA_Onar_PERM_15_00"); //¿Va todo bien en la granja?
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_01"); //No creo que sea asunto tuyo. ¡No deberías estar en la granja!
	};
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_02"); //¡Eso espero! ¡Al fin y al cabo, para eso te pago!
		AI_Output (self, other, "DIA_Onar_PERM_14_03"); //Sería mejor que fueras a ver a Torlof y le preguntaras si tiene trabajo para ti.
	};
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_04"); //Sí, claro. Ve a cazar dragones.
	};
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_05"); //¡Aquí no tragamos a los bastardos mojigatos del monasterio!
	};
	
	if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_06"); //No ofrecemos nuestra hospitalidad a las tropas del rey.
	};
};

// ************************************************************
// 			  				Work 
// ************************************************************
INSTANCE DIA_Onar_Work (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 2;
	condition   = DIA_Onar_Work_Condition;
	information = DIA_Onar_Work_Info;
	permanent   = FALSE;
	description = "¡Quiero trabajar para ti!";
};
FUNC INT DIA_Onar_Work_Condition()
{
	if (Lee_SendToOnar == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_Work_Info()
{
	AI_Output (other, self, "DIA_Onar_Work_15_00"); //¡Quiero trabajar para ti!
	AI_Output (self, other, "DIA_Onar_Work_14_01"); //Ahora mismo no necesito mozos.
	AI_Output (self, other, "DIA_Onar_Work_14_02"); //Mi gente se ocupa de todo lo demás.
	AI_Output (self, other, "DIA_Onar_Work_14_03"); //En la casa no pintas nada, así que lárgate.
};


// ************************************************************
// 			  				WorkAsSld
// ************************************************************
INSTANCE DIA_Onar_WorkAsSld (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 2;
	condition   = DIA_Onar_WorkAsSld_Condition;
	information = DIA_Onar_WorkAsSld_Info;
	permanent   = FALSE;
	description = "¡Quiero trabajar aquí como mercenario!";
};
FUNC INT DIA_Onar_WorkAsSld_Condition()
{
	if (Lee_SendToOnar == FALSE)
	&& (Onar_WegenSldWerden == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Onar_Work))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WorkAsSld_Info()
{
	AI_Output (other, self, "DIA_Onar_WorkAsSld_15_00"); //¡Quiero trabajar aquí como mercenario?
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_01"); //¿Mercenario tú? ¡No me hagas reír! Si fueras bueno como mercenario, Lee me habría hablado de ti.
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_02"); //¡Sal de aquí ahora mismo!
	Onar_WegenSldWerden = TRUE;
};

// ************************************************************
// 			  				Aufstand
// ************************************************************
INSTANCE DIA_Onar_Aufstand (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 3;
	condition   = DIA_Onar_Aufstand_Condition;
	information = DIA_Onar_Aufstand_Info;
	permanent   = FALSE;
	description = "He oído que os habéis rebelado contra la ciudad.";
};
FUNC INT DIA_Onar_Aufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_Aufstand_Info()
{
	AI_Output (other, self, "DIA_Onar_Aufstand_15_00"); //He oído que os habéis rebelado contra la ciudad.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_01"); //Escúchame atentamente. Heredé la granja y estas tierras de mi padre.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_02"); //Y él las heredó de su padre.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_03"); //No voy a permitir que ese avaro imbécil que tenemos por rey se quede con todo para alimentar a sus inútiles ejércitos.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_04"); //La guerra con los orcos no se acaba nunca, y ¿cómo estamos? Al borde de la derrota.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_05"); //No. ¡Prefiero defender la granja por mi cuenta! Con el dinero que me ahorro, puedo costearme un ejército.
};

// ************************************************************
// 			  				WegenPepe
// ************************************************************
INSTANCE DIA_Onar_WegenPepe (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 4;
	condition   = DIA_Onar_WegenPepe_Condition;
	information = DIA_Onar_WegenPepe_Info;
	permanent   = FALSE;
	description = "Gracias a Bullco tienes algunas ovejas menos.";
};
FUNC INT DIA_Onar_WegenPepe_Condition()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WegenPepe_Info()
{
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_00"); //Gracias a Bullco tienes algunas ovejas menos.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_01"); //¿De qué estás hablando? ¿Quién es Bullco?
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_02"); //Uno de los mercenarios.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_03"); //¿Y a mí qué? Si me ha robado ovejas, tendrá que responder ante Lee.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_04"); //¿Por qué me incordias con detalles tan triviales?
	Onar_WegenPepe = TRUE;
};

// ************************************************************
// 			  				WegenSekob
// ************************************************************
INSTANCE DIA_Onar_WegenSekob (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 5;
	condition   = DIA_Onar_WegenSekob_Condition;
	information = DIA_Onar_WegenSekob_Info;
	permanent   = FALSE;
	description = "He venido por el asunto de la renta de Sekob...";
};
FUNC INT DIA_Onar_WegenSekob_Condition()
{
	if (MIS_Sekob_RedeMitOnar == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WegenSekob_Info()
{
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_00"); //He venido por el asunto de la renta de Sekob...

	if (other.guild == GIL_SLD) || (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_01"); //¿Qué narices pintas aquí? Llévale el dinero a Torlof.
	
	}
	else //GIL_NONE
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_02"); //¿Por qué leches es de tu incumbencia?
		AI_Output (other, self, "DIA_Onar_WegenSekob_15_03"); //Quiero convertirme en mercenario y me han puesto a prueba recaudando las rentas.
		Onar_WegenSldWerden = TRUE;
	};
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_04"); //Pero Sekob no tiene dinero, e incluso le he dado una paliza.
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_05"); //Me dijo que era por la mala cosecha...
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_06"); //(Chillando) ¡Estúpido! ¿Te crees que lleva el dinero encima? ¡Lo tiene escondido en algún sitio!
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_07"); //¿Sabes lo que llueve por aquí? Una mala cosecha... ¡Una mierda!
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_08"); //Sácale el dinero a palos.
	Onar_WegenSekob = TRUE;
};


// ************************************************************
// 			  			Lee schickt mich 
// ************************************************************
INSTANCE DIA_Onar_LeeSentMe   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 6;
	condition   = DIA_Onar_LeeSentMe_Condition;
	information = DIA_Onar_LeeSentMe_Info;
	permanent   = FALSE;
	description = "Me manda Lee. ¡Quiero trabajar aquí de mercenario!";
};
FUNC INT DIA_Onar_LeeSentMe_Condition()
{
	if (Lee_SendToOnar == TRUE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_LeeSentMe_Info()
{
	AI_Output (other, self, "DIA_Onar_LeeSentMe_15_00"); //Me manda Lee. ¡Quiero trabajar aquí de mercenario!
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_01"); //Ya me lo ha dicho.
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_02"); //La primera vez que me lo pediste no me diste muy buena impresión.
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_03"); //Pero si Lee cree que sirvas, estoy dispuesto a darte una oportunidad.
	};
	
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_04"); //Él responde de ti, así que haz lo que quieras.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_05"); //¡Pero no hagas el tonto! Deja en paz a los granjeros y a las doncellas y, sobre todo, no afanes nada, ¿capisce?
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_06"); //Para todo lo demás, habla con Lee.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_07"); //Solo nos queda hablar de la paga.

	Onar_Approved = TRUE;
	B_LogEntry (TOPIC_BecomeSLD,"Onar me ha dado su aprobación. Ahora nada podrá evitar que me una a los mercenarios.");
};



// ************************************************************
// 			  			Sold verhandeln
// ************************************************************
var int Onar_SOLD_Day;
var int Onar_SOLD_XP;
// -------------------

INSTANCE DIA_Onar_HowMuch   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 7;
	condition   = DIA_Onar_HowMuch_Condition;
	information = DIA_Onar_HowMuch_Info;
	permanent   = FALSE;
	description = "¿Qué hay de la paga?";
};
FUNC INT DIA_Onar_HowMuch_Condition()
{
	if (Onar_Approved == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_HowMuch_Info()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_15_00"); //¿Qué hay de la paga?
	AI_Output (self, other, "DIA_Onar_HowMuch_14_01"); //A ver...
	
	SOLD = 50;
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_02"); //No tengo muy buena impresión de ti.
	};
	
	if (Onar_WegenSekob == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_03"); //No eres muy espabilado y eso se ha visto en el asunto de Sekob.
		SOLD = SOLD - 10;
	};
	
	if (ABSOLUTIONLEVEL_Farm > 1)
	|| ( (B_GetGreatestPetzCrime (self) > CRIME_NONE) && (ABSOLUTIONLEVEL_Farm > 0) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_04"); //Ya has causado problemas en la granja en más de una ocasión.
		SOLD = SOLD - 10;
	};
	
	if (Onar_WegenPepe == TRUE)
	&& ( (Onar_WegenSekob == TRUE) || (Onar_WegenSldWerden == TRUE) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_05"); //Y no dejas de incordiarme con todo tipo de chorradas.
		SOLD = SOLD - 10;
	};
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_06"); //Déjame pensar...
	B_Say_Gold (self, other, SOLD);
	
	
	Onar_SOLD_Day = Wld_GetDay();
	Onar_SOLD_XP = other.exp;
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_07"); //¿Qué te parece?
	
	Info_ClearChoices (DIA_Onar_HowMuch);
	Info_AddChoice (DIA_Onar_HowMuch, "¡Me parece estupendo!", DIA_Onar_HowMuch_Ok);
	Info_AddChoice (DIA_Onar_HowMuch, "No es mucho...", DIA_Onar_HowMuch_More);
	Info_AddChoice (DIA_Onar_HowMuch, "¿Al día?", DIA_Onar_HowMuch_PerDay);
};

func void DIA_Onar_HowMuch_PerDay()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_PerDay_15_00"); //¿Al día?
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_01"); //¿Y tú que te creías? ¿A la semana? No eres muy listo.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_02"); //Mueve el culo y ven a por tu dinero.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_03"); //Yo no voy a llevártelo.
};

func void DIA_Onar_HowMuch_More()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_More_15_00"); //No es mucho...
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_01"); //Por supuesto, también puedes trabajar gratis para mí si quieres.
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_02"); //En cualquier caso, esto es todo.
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Onar me da mi paga cada día.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
func void DIA_Onar_HowMuch_Ok()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_Ok_15_00"); //¡Me parece estupendo!
	AI_Output (self, other, "DIA_Onar_HowMuch_Ok_14_01"); //A mí también. Ahora ve a ver a Lee.
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Onar me da mi paga cada día.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
// ************************************************************
// 			  				Sold abholen
// ************************************************************

INSTANCE DIA_Onar_CollectGold (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 8;
	condition   = DIA_Onar_CollectGold_Condition;
	information = DIA_Onar_CollectGold_Info;
	permanent   = TRUE;
	description = "¡Págame el sueldo!";
};
FUNC INT DIA_Onar_CollectGold_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	&& ( (other.guild == GIL_SLD) || (other.guild == GIL_DJG) )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_CollectGold_Info()
{
	AI_Output (other, self, "DIA_Onar_CollectGold_15_00"); //¡Págame el sueldo!
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_01"); //Yo pago a mercenarios, no a cazadores de dragones.
	}
	else if (Torlof_TheOtherMission_TooLate == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_02"); //¡No te ocupas de las tareas que te encargan!
		AI_Output (self, other, "DIA_Onar_CollectGold_14_03"); //He preguntado a Torlof qué tal vas y me ha dicho que tardas mucho en acabar tus trabajos.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_04"); //No despilfarro dinero en haraganes.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_05"); //¡Te vas a pasar unas cuantas semanas sin paga! A ver si te sirve de escarmiento.
	}
	else if (B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_06"); //Tengo entendido que la has cagado. Antes ve a ver a Lee y soluciona el asunto.
	}
	else if (Wld_GetDay() <= Onar_SOLD_Day)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_07"); //¿Estás loco?
		AI_Output (self, other, "DIA_Onar_CollectGold_14_08"); //Primero trabaja para mí durante un día y mañana recibirás la siguiente paga.
	}
	else if (Wld_GetDay() - 2 >= Onar_SOLD_Day)
	{
		if (Wld_GetDay() - 2 == Onar_SOLD_Day)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_09"); //¿Dónde estuviste ayer?
		}
		else
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_10"); //¿Dónde has estado los dos últimos días?
		};
	
		AI_Output (self, other, "DIA_Onar_CollectGold_14_11"); //No se te vio el pelo.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_12"); //A saber dónde habrás estado.
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	}
	else //genau 1 Tag später...
	{
		if (other.exp > Onar_SOLD_XP + 200)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_13"); //(Arrepentido) Bueno, aquí tienes la paga.
			
			//patch m.F. 
			B_GiveInvItems (self, other, itmi_gold, SOLD);
			B_Say_Gold (self, other, SOLD);
		}
		else //nur gepennt
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_14"); //¿Qué? ¡Cuando no te dormías, te dedicabas a haraganear!
			AI_Output (self, other, "DIA_Onar_CollectGold_14_15"); //¡No voy a pagarte por eso!
		};
		
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	};
};
	
// ************************************************************
// 			  				Sold abholen
// ************************************************************

INSTANCE DIA_Onar_MariaGold (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 9;
	condition   = DIA_Onar_MariaGold_Condition;
	information = DIA_Onar_MariaGold_Info;
	permanent   = FALSE;
	description = "María cree que no gano bastante.";
};
FUNC INT DIA_Onar_MariaGold_Condition()
{
	if (Maria_MehrGold == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_MariaGold_Info()
{
	AI_Output (other, self, "DIA_Onar_MariaGold_15_00"); //María cree que no gano bastante.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_01"); //¿Qué?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_02"); //Me ha dicho que deberías pagarme más.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_03"); //(Quejándose) Esa mujer tiene que meter las narices en todo.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_04"); //¿Ha dicho cuánto?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_05"); //No.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_06"); //De acuerdo. A partir de la siguiente paga, te subiré el sueldo 10 monedas de oro.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_07"); //Pero ni una moneda más, ¿te enteras?
	
	SOLD = SOLD + 10;
};	


// ************************************************************
// 			  				WannaSheep
// ************************************************************
var int Onar_SellSheep;
// --------------------

instance DIA_Onar_WannaSheep	(C_INFO)
{
	npc			 = 	BAU_900_Onar;
	nr			 = 	10;
	condition	 = 	DIA_Onar_WannaSheep_Condition;
	information	 = 	DIA_Onar_WannaSheep_Info;
	permanent	 = 	TRUE;
	description	 = 	"¡Quiero comprar una oveja!";
};
func int DIA_Onar_WannaSheep_Condition ()
{	
	if (Onar_SellSheep == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Onar_WannaSheep_Info ()
{
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_00"); //¡Quiero comprar una oveja!
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_01"); //Entonces, ¿qué haces aquí? ¿Ves alguna oveja?
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_02"); //Yo...
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_03"); //Si quieres comprar una oveja, ve a la pradera. Está a la derecha de mi casa.
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_04"); //Que Pepe te venda una.
	
	if (Npc_IsDead (Pepe))
	{
		AI_Output (other, self, "DIA_Onar_WannaSheep_15_05"); //Me temo que Pepe ha muerto.
		AI_Output (self, other, "DIA_Onar_WannaSheep_14_06"); //¡Oh! En ese caso... págame 200 monedas de oro y coge una oveja de la pradera.
		
		Onar_SellSheep = TRUE;
	};
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
instance DIA_Onar_BuyLiesel	(C_INFO)
{
	npc			 = 	BAU_900_Onar;
	nr			 = 	10;
	condition	 = 	DIA_Onar_BuyLiesel_Condition;
	information	 = 	DIA_Onar_BuyLiesel_Info;
	permanent	 = 	TRUE;
	description	 = 	"Aquí tienes, 200 monedas de oro. Dame una oveja.";
};
func int DIA_Onar_BuyLiesel_Condition ()
{	
	if (Onar_SellSheep == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Onar_BuyLiesel_Info ()
{
	AI_Output (other, self, "DIA_Onar_BuyLiesel_15_00"); //Aquí tienes, 200 monedas de oro. Dame una oveja.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_01"); //Coge una de la pradera.
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_02"); //Seguro que te sigue alguna de las ovejas. La mayoría responde al nombre de Betsy.
		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_03"); //No tienes tanto oro. No me hagas perder mi valioso tiempo.
	};
};
