///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rukhar_EXIT   (C_INFO)
{
	npc         = BAU_973_Rukhar;
	nr          = 999;
	condition   = DIA_Rukhar_EXIT_Condition;
	information = DIA_Rukhar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rukhar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rukhar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_HALLO		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	4;
	condition	 = 	DIA_Rukhar_HALLO_Condition;
	information	 = 	DIA_Rukhar_HALLO_Info;

	description	 = 	"�La cerveza es buena?";
};

func int DIA_Rukhar_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rukhar_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_HALLO_15_00"); //�La cerveza es buena?
	AI_Output			(self, other, "DIA_Rukhar_HALLO_12_01"); //No es la mejor, pero en estos tiempos funestos no se puede ser quisquilloso.

};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	5;
	condition	 = 	DIA_Rukhar_WASMACHSTDU_Condition;
	information	 = 	DIA_Rukhar_WASMACHSTDU_Info;

	description	 = 	"�Qu� est�s haciendo aqu�?";
};

func int DIA_Rukhar_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rukhar_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rukhar_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_WASMACHSTDU_15_00"); //�Qu� haces aqu�?
	AI_Output			(self, other, "DIA_Rukhar_WASMACHSTDU_12_01"); //Hasta hace unas semanas, trabajaba como un esclavo en los campos del terrateniente.
	AI_Output			(self, other, "DIA_Rukhar_WASMACHSTDU_12_02"); //Un d�a me hart� y me largu� de inmediato.
	AI_Output			(self, other, "DIA_Rukhar_WASMACHSTDU_12_03"); //Ahora soy mi propio jefe. Todo lo que tengo est� en este arc�n. Y no necesito nada m�s.
	AI_Output			(self, other, "DIA_Rukhar_WASMACHSTDU_12_04"); //�Te interesa participar en un concurso?
	Log_CreateTopic (TOPIC_Wettsaufen, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen, LOG_RUNNING);
	B_LogEntry (TOPIC_Wettsaufen,"En la taberna se realizan apuestas."); 

};


///////////////////////////////////////////////////////////////////////
//	Info Wettkampf
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_WETTKAMPF		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_WETTKAMPF_Condition;
	information	 = 	DIA_Rukhar_WETTKAMPF_Info;

	description	 = 	"�En qu� tipo de concurso?";
};

func int DIA_Rukhar_WETTKAMPF_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rukhar_WASMACHSTDU))
		{
				return TRUE;
		};
};

func void DIA_Rukhar_WETTKAMPF_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_WETTKAMPF_15_00"); //�En qu� tipo de concurso?
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_01"); //Yo lo llamo HASTA EL FONDO.
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_02"); //Las reglas son muy sencillas.
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_03"); //Nos vamos turnando a la hora de pedir jarras de la mejor cerveza que tiene este vejestorio.
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_04"); //Hay que apurar del todo la jarra, y si la damos la vuelta sobre la mesa no puede dejar c�rculo.
	AI_Output			(self, other, "DIA_Rukhar_WETTKAMPF_12_05"); //Gana el �ltimo que quede en pie. El perdedor paga la cuenta y lo que nos apostemos. �Y bien? �Qu� te parece?
	AI_Output			(other, self, "DIA_Rukhar_WETTKAMPF_15_06"); //Quiz� en otra ocasi�n, cuando no tenga prisa.

};

///////////////////////////////////////////////////////////////////////
//	Info HoleRandolph
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_HOLERANDOLPH		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_HOLERANDOLPH_Condition;
	information	 = 	DIA_Rukhar_HOLERANDOLPH_Info;

	description	 = 	"�Puedo apostar por otro?";
};

func int DIA_Rukhar_HOLERANDOLPH_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rukhar_WETTKAMPF))
		{
				return TRUE;
		};
};

func void DIA_Rukhar_HOLERANDOLPH_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_HOLERANDOLPH_15_00"); //�Puedo apostar por otro?
	AI_Output			(self, other, "DIA_Rukhar_HOLERANDOLPH_12_01"); //Desde luego. Si encuentras a alguien con agallas para enfrentarse a m�, apostar� contigo.
	AI_Output			(self, other, "DIA_Rukhar_HOLERANDOLPH_12_02"); //Todos ponen el mismo dinero en un bote, y el ganador se lo lleva todo. La cuant�a de la apuesta depende de lo que tengas.
	AI_Output			(self, other, "DIA_Rukhar_HOLERANDOLPH_12_03"); //Si me traes a alguien que se atreva a competir conmigo, puedes apostar.
	B_LogEntry (TOPIC_Wettsaufen,"Rukhar llama a su peque�o juego AL CENTRO Y PA DENTRO. No, gracias, no me interesa. Encontrar� a otro de quien pueda re�rse."); 

};

///////////////////////////////////////////////////////////////////////
//	Info RandolphWill
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_RANDOLPHWILL		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_RANDOLPHWILL_Condition;
	information	 = 	DIA_Rukhar_RANDOLPHWILL_Info;
	permanent	 = 	TRUE;

	description	 = 	"Tengo a alguien que quiere competir contigo.";
};

var int DIA_Rukhar_RANDOLPHWILL_noPerm;

func int DIA_Rukhar_RANDOLPHWILL_Condition ()
{
	if  (
		(Npc_KnowsInfo(other, DIA_Randolph_GEGENWEN))
		&& (Npc_KnowsInfo(other, DIA_Rukhar_HOLERANDOLPH))
		&& (DIA_Rukhar_RANDOLPHWILL_noPerm == FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_Rukhar_RANDOLPHWILL_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_15_00"); //Tengo a alguien que quiere competir contigo.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_01"); //�De qui�n se trata?
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_15_02"); //De Randolph.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_03"); //Jo, jo. �Randolph el fanfarr�n? Muy bien. �Por qu� no?
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_04"); //M�ndame a ese alfe�ique. El trato sigue en pie.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_05"); //Rec�gele dentro de dos d�as. �Qui�n sabe? A lo mejor tienes suerte y es capaz de levantarse para entonces.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_12_06"); //�Cu�nto te apuestas?

	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);

	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "Nada.", DIA_Rukhar_RANDOLPHWILL_nix );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "100", DIA_Rukhar_RANDOLPHWILL_100 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "50", DIA_Rukhar_RANDOLPHWILL_50 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "20", DIA_Rukhar_RANDOLPHWILL_20 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "10 monedas de oro.", DIA_Rukhar_RANDOLPHWILL_10 );
};
func void DIA_Rukhar_RANDOLPHWILL_annehmen ()
{
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_annehmen_12_00"); //Me guardo tu apuesta hasta que acabe el concurso, �vale?
	DIA_Rukhar_RANDOLPHWILL_noPerm = TRUE;
};

func void DIA_Rukhar_RANDOLPHWILL_mehr ()
{
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);

	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "Nada.", DIA_Rukhar_RANDOLPHWILL_nix );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "100", DIA_Rukhar_RANDOLPHWILL_100 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "50", DIA_Rukhar_RANDOLPHWILL_50 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "20", DIA_Rukhar_RANDOLPHWILL_20 );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "10 monedas de oro.", DIA_Rukhar_RANDOLPHWILL_10 );
};


func void DIA_Rukhar_RANDOLPHWILL_nix ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_nix_15_00"); //Nada.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_nix_12_01"); //Entonces ser� mejor que lo olvidemos.

	AI_StopProcessInfos (self);
};

func void DIA_Rukhar_RANDOLPHWILL_10 ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_10_15_00"); //10 monedas de oro.
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_10_12_01"); //Venga, me tomas el pelo. No te vas a morir si apuestas unas monedas m�s.

	Rukhar_Einsatz = 10;
	Rukhar_Gewinn = 20;

	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(seleccionar otra apuesta)", DIA_Rukhar_RANDOLPHWILL_mehr );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(aceptar apuesta)", DIA_Rukhar_RANDOLPHWILL_annehmen );
};

func void DIA_Rukhar_RANDOLPHWILL_20 ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_20_15_00"); //20
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_20_12_01"); //Si quieres apostar, ten la amabilidad de hacerlo en condiciones.

	Rukhar_Einsatz = 20;
	Rukhar_Gewinn = 40;
	
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(seleccionar otra apuesta)", DIA_Rukhar_RANDOLPHWILL_mehr );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(aceptar apuesta)", DIA_Rukhar_RANDOLPHWILL_annehmen );
};

func void DIA_Rukhar_RANDOLPHWILL_50 ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_50_15_00"); //50
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_50_12_01"); //No tan t�mido. Atr�vete.

	Rukhar_Einsatz = 50;
	Rukhar_Gewinn = 100;
	
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(seleccionar otra apuesta)", DIA_Rukhar_RANDOLPHWILL_mehr );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(aceptar apuesta)", DIA_Rukhar_RANDOLPHWILL_annehmen );
};

func void DIA_Rukhar_RANDOLPHWILL_100 ()
{
	AI_Output			(other, self, "DIA_Rukhar_RANDOLPHWILL_100_15_00"); //100
	AI_Output			(self, other, "DIA_Rukhar_RANDOLPHWILL_100_12_01"); //As� me gusta.
	
	Rukhar_Einsatz = 100;
	Rukhar_Gewinn = 200;
	
	Info_ClearChoices	(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(seleccionar otra apuesta)", DIA_Rukhar_RANDOLPHWILL_mehr );
	Info_AddChoice	(DIA_Rukhar_RANDOLPHWILL, "(aceptar apuesta)", DIA_Rukhar_RANDOLPHWILL_annehmen );
};

///////////////////////////////////////////////////////////////////////
//	Info IchSeheDich
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_ICHSEHEDICH		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_ICHSEHEDICH_Condition;
	information	 = 	DIA_Rukhar_ICHSEHEDICH_Info;
	permanent	 = 	TRUE;
	
	description	=	"Aqu� est� mi apuesta.";
};

var int DIA_Rukhar_ICHSEHEDICH_noPerm;

func int DIA_Rukhar_ICHSEHEDICH_Condition ()
{
	if 	(
		(DIA_Rukhar_ICHSEHEDICH_noPerm == FALSE)
		&& (DIA_Rukhar_RANDOLPHWILL_noPerm == TRUE)
		&& (Rukhar_Einsatz != 0)
		)
			{
					return TRUE;
			};
};

func void DIA_Rukhar_ICHSEHEDICH_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_ICHSEHEDICH_15_00"); //Aqu� est� mi apuesta.

	if (B_GiveInvItems (other, self, ItMi_Gold, Rukhar_Einsatz))
		{
			AI_Output			(self, other, "DIA_Rukhar_ICHSEHEDICH_12_01"); //Muy bien. No tardes en traer a Randolph, �me oyes?
			DIA_Rukhar_ICHSEHEDICH_noPerm = TRUE;
			MIS_Rukhar_Wettkampf = LOG_RUNNING; 
			B_GivePlayerXP (XP_Ambient);
		}
	else
		{
			AI_Output			(self, other, "DIA_Rukhar_ICHSEHEDICH_12_02"); //Qu� gracioso. Vuelve cuando tengas suficiente dinero.
		};
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info geldzurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_GELDZURUECK		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_GELDZURUECK_Condition;
	information	 = 	DIA_Rukhar_GELDZURUECK_Info;
	permanent	 = 	TRUE;
	
	description	 = 	"Quiero recuperar mi dinero.";
};

func int DIA_Rukhar_GELDZURUECK_Condition ()
{
	if 	(
		(MIS_Rukhar_Wettkampf == LOG_SUCCESS)
		&& (Rukhar_Won_Wettkampf == TRUE)
		)
	{
				return TRUE;
	};
};

func void DIA_Rukhar_GELDZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_GELDZURUECK_15_00"); //Quiero recuperar mi dinero.
	AI_Output			(self, other, "DIA_Rukhar_GELDZURUECK_12_01"); //Las deudas de juego son deudas de honor, amigo. Ten�as que hab�rtelo pensado antes.

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Haenseln
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_HAENSELN		(C_INFO)
{
	npc		 = 	BAU_973_Rukhar;
	nr		 = 	3;
	condition	 = 	DIA_Rukhar_HAENSELN_Condition;
	information	 = 	DIA_Rukhar_HAENSELN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Parece que has tratado de abarcar m�s de lo que puedes.";
};

func int DIA_Rukhar_HAENSELN_Condition ()
{
	if 	(
		(MIS_Rukhar_Wettkampf == LOG_SUCCESS)
		&& (Rukhar_Won_Wettkampf == FALSE)
		)
	{
				return TRUE;
	};
};

var int DIA_Rukhar_HAENSELN_nureimalgeld;

func void DIA_Rukhar_HAENSELN_Info ()
{
	AI_Output			(other, self, "DIA_Rukhar_HAENSELN_15_00"); //Parece que has tratado de abarcar m�s de lo que puedes.

	if	(DIA_Rukhar_HAENSELN_nureimalgeld == FALSE)
		{
			AI_Output			(self, other, "DIA_Rukhar_HAENSELN_12_01"); //Ten tu dinero, y no digas ni una palabra m�s.
			B_GivePlayerXP (XP_Rukhar_Lost);

			IntToFloat (Rukhar_Gewinn);
					
			CreateInvItems (self, ItMi_Gold, Rukhar_Gewinn);									
			B_GiveInvItems (self, other, ItMi_Gold, Rukhar_Gewinn);					

			DIA_Rukhar_HAENSELN_nureimalgeld = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Rukhar_HAENSELN_12_02"); //Ya me las pagar�s, dalo por descontado.
		};

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_Perm		(C_INFO)
{
	npc			 = 	BAU_973_Rukhar;
	nr		 = 	7;
	condition	 = 	DIA_Rukhar_Perm_Condition;
	information	 = 	DIA_Rukhar_Perm_Info;
	permanent	 = 	TRUE;
	description	 = 	"�Ha pasado alguna otra cosa de inter�s?";
};

func int DIA_Rukhar_Perm_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Rukhar_WASMACHSTDU))
		{
				return TRUE;
		};
};
func void DIA_Rukhar_Perm_Info ()
{
	AI_Output (other, self, "DIA_Rukhar_Perm_15_00"); //�Ha pasado alguna otra cosa de inter�s?
	AI_Output (self, other, "DIA_Rukhar_Perm_12_01"); //No que yo sepa. Nadie me cuenta nada.
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rukhar_PICKPOCKET (C_INFO)
{
	npc			= BAU_973_Rukhar;
	nr			= 900;
	condition	= DIA_Rukhar_PICKPOCKET_Condition;
	information	= DIA_Rukhar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Rukhar_PICKPOCKET_Condition()
{
	C_Beklauen (26, 30);
};
 
FUNC VOID DIA_Rukhar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rukhar_PICKPOCKET);
	Info_AddChoice		(DIA_Rukhar_PICKPOCKET, DIALOG_BACK 		,DIA_Rukhar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rukhar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rukhar_PICKPOCKET_DoIt);
};

func void DIA_Rukhar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rukhar_PICKPOCKET);
};
	
func void DIA_Rukhar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rukhar_PICKPOCKET);
};




 


























