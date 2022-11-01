///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rethon_EXIT   (C_INFO)
{
	npc         = DJG_709_Rethon;
	nr          = 999;
	condition   = DIA_Rethon_EXIT_Condition;
	information = DIA_Rethon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rethon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rethon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_HALLO		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	5;
	condition	 = 	DIA_Rethon_HALLO_Condition;
	information	 = 	DIA_Rethon_HALLO_Info;

	description	 = 	"¿Qué estás haciendo aquí?";
};

func int DIA_Rethon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rethon_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_HALLO_15_00"); //¿Qué haces aquí?
	AI_Output			(self, other, "DIA_Rethon_HALLO_12_01"); //Estoy preparándome para luchar. ¿Qué otra cosa podría hacer?
};


 ///////////////////////////////////////////////////////////////////////
//	Info Kampf
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_KAMPF		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	6;
	condition	 = 	DIA_Rethon_KAMPF_Condition;
	information	 = 	DIA_Rethon_KAMPF_Info;

	description	 = 	"¿Con quién quieres luchar?";
};

func int DIA_Rethon_KAMPF_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_KAMPF_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_KAMPF_15_00"); //¿Con quién quieres luchar?
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_01"); //Había pensado en ir a ver a los paladines y darles una buena paliza.
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_02"); //Imbécil. Con los dragones, por supuesto. ¿Qué te creías?
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_PALADINE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	6;
	condition	 = 	DIA_Rethon_PALADINE_Condition;
	information	 = 	DIA_Rethon_PALADINE_Info;

	description	 = 	"¿A los paladines no les molestará que estés aquí?";
};

func int DIA_Rethon_PALADINE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_PALADINE_15_00"); //¿A los paladines no les importa que estéis aquí?
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_01"); //Tonterías. Tienen otros problemas. La mayoría se alegran de seguir vivos.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_02"); //La moral de los muchachos no es la mejor. Eso será su perdición.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_03"); //Mira esas espadas melladas que arreglan para combatir con ellas.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_04"); //Un guerrero razonable desertaría de inmediato.

};


///////////////////////////////////////////////////////////////////////
//	Info WoGruppe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_WOGRUPPE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	7;
	condition	 = 	DIA_Rethon_WOGRUPPE_Condition;
	information	 = 	DIA_Rethon_WOGRUPPE_Info;

	description	 = 	"¿Te has separado de tu grupo?";
};

func int DIA_Rethon_WOGRUPPE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_WOGRUPPE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_WOGRUPPE_15_00"); //¿Te has separado de tu grupo?
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_01"); //¿Mi grupo? No pertenezco a ningún grupo. Me dedico a coleccionar trofeos.
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_02"); //Si vuelvo a casa sin ningún trofeo, no sabré a qué he venido. Por eso no puedo ir con nadie.
};


///////////////////////////////////////////////////////////////////////
//	Info drachengesehen
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_DRACHENGESEHEN		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	8;
	condition	 = 	DIA_Rethon_DRACHENGESEHEN_Condition;
	information	 = 	DIA_Rethon_DRACHENGESEHEN_Info;

	description	 = 	"¿Ya has visto algún dragón?";
};

func int DIA_Rethon_DRACHENGESEHEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_KAMPF))
		{
				return TRUE;
		};
};

func void DIA_Rethon_DRACHENGESEHEN_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_DRACHENGESEHEN_15_00"); //¿Ya has visto algún dragón?
	AI_Output			(self, other, "DIA_Rethon_DRACHENGESEHEN_12_01"); //No. Quiero afilar las armas antes de partir.
};

///////////////////////////////////////////////////////////////////////
//	Info Angst
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_ANGST		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	9;
	condition	 = 	DIA_Rethon_ANGST_Condition;
	information	 = 	DIA_Rethon_ANGST_Info;

	description	 = 	"¿No tienes miedo de que alguien te venza?";
};

func int DIA_Rethon_ANGST_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_WOGRUPPE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_ANGST_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_00"); //¿No tienes miedo de que alguien te venza?

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_01"); //¿Qué? ¿Quién? ¿Sylvio?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_02"); //Tu jefe piensa que puede forrarse, ¿eh?
			AI_Output			(other, self, "DIA_Rethon_ANGST_15_03"); //No soy uno de los hombres de Sylvio. Trabajo por mi cuenta.
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_04"); //Oh. De acuerdo. Entonces, no he dicho nada.
		};

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_05"); //¿Has visto a los pobres diablos que lo acompañan?
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_06"); //Sylvio debería alegrarse si sale de aquí con vida.

	if (Npc_IsDead(DJG_Sylvio))
	{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_07"); //No va a hacerlo. Ha muerto.
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_08"); //Me parece bien.
	}
	else
	{
	Info_AddChoice	(DIA_Rethon_ANGST, DIALOG_BACK, DIA_Rethon_ANGST_weiter );
	Info_AddChoice	(DIA_Rethon_ANGST, "Parece que no te cae bien.", DIA_Rethon_ANGST_sylviomoegen );
	Info_AddChoice	(DIA_Rethon_ANGST, "¿Y dónde está ahora Sylvio?", DIA_Rethon_ANGST_woSylvio );
	Info_AddChoice	(DIA_Rethon_ANGST, "¿Sylvio ha estado aquí?", DIA_Rethon_ANGST_sylviohier );
	};
};

func void DIA_Rethon_ANGST_weiter ()
{
	Info_ClearChoices	(DIA_Rethon_ANGST);
};

func void DIA_Rethon_ANGST_sylviohier ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviohier_15_00"); //¿Sylvio ha estado aquí?
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_01"); //¿Te refieres al castillo? Sí, estuvo aquí, pero muy poco tiempo.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_02"); //Habló con unas cuantas personas y luego reemprendió la marcha.

};

func void DIA_Rethon_ANGST_sylviomoegen ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviomoegen_15_00"); //Parece que no te cae bien.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_01"); //¿A qué te refieres con lo de que no me cae bien? No me siento muy orgulloso de conocerlo.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_02"); //Sylvio no tiene amigos. Necesita gente que le siga a toda costa.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_03"); //Eso no es para mí. Yo trabajo por mi cuenta.


};

func void DIA_Rethon_ANGST_woSylvio ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_woSylvio_15_00"); //¿Y dónde está ahora Sylvio?
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_01"); //Los paladines mencionaron que en el oeste había un dragón de hielo. Se supone que es el más peligroso y poderoso de todos.
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_02"); //Deberías haber visto el brillo en los ojos de Sylvio cuando se enteró. Seguro que ha ido para allá.

	B_LogEntry (TOPIC_DRACHENJAGD,"Rethon, el cazador de dragones, masculló algo acerca de un dragón de hielo."); 
	B_LogEntry (TOPIC_Dragonhunter,"Sylvio estaba en el castillo y partió en busca de un dragón de hielo.");

};



///////////////////////////////////////////////////////////////////////
//	Info meineWaffe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_MEINEWAFFE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	10;
	condition	 = 	DIA_Rethon_MEINEWAFFE_Condition;
	information	 = 	DIA_Rethon_MEINEWAFFE_Info;

	description	 = 	"¿Me ayudas a mejorar mis armas?";
};

func int DIA_Rethon_MEINEWAFFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_PALADINE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_MEINEWAFFE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_MEINEWAFFE_15_00"); //¿Me ayudas a mejorar mis armas?
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_01"); //¿Mejorar? Será mejor que te compres algo nuevo y tires esa chatarra.
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_02"); //A lo mejor tengo algo para ti. ¿Te interesa?
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_TRADE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	11;
	condition	 = 	DIA_Rethon_TRADE_Condition;
	information	 = 	DIA_Rethon_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	
	description	 = 	"¿Qué puedes venderme?";
};

func int DIA_Rethon_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_MEINEWAFFE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_TRADE_15_00"); //¿Qué puedes venderme?
	B_GiveTradeInv (self);

	if (hero.guild == GIL_PAL)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_01"); //Vaya, qué bajo he caído. Hasta le vendo mis armas a un paladín.
		}
	else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_02"); //No tengo gran cosa para un mago, pero puedes echar un vistazo.
		}
	else
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_03"); //Creo que tengo lo que quieres, amigo.
		};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rethon_PICKPOCKET (C_INFO)
{
	npc			= DJG_709_Rethon;
	nr			= 900;
	condition	= DIA_Rethon_PICKPOCKET_Condition;
	information	= DIA_Rethon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Rethon_PICKPOCKET_Condition()
{
	C_Beklauen (78, 230);
};
 
FUNC VOID DIA_Rethon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rethon_PICKPOCKET);
	Info_AddChoice		(DIA_Rethon_PICKPOCKET, DIALOG_BACK 		,DIA_Rethon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rethon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rethon_PICKPOCKET_DoIt);
};

func void DIA_Rethon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rethon_PICKPOCKET);
};
	
func void DIA_Rethon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rethon_PICKPOCKET);
};


