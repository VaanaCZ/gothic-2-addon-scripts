///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Balthasar_EXIT   (C_INFO)
{
	npc         = BAU_932_Balthasar;
	nr          = 999;
	condition   = DIA_Balthasar_EXIT_Condition;
	information = DIA_Balthasar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Balthasar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Balthasar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_HALLO		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	3;
	condition	 = 	DIA_Balthasar_HALLO_Condition;
	information	 = 	DIA_Balthasar_HALLO_Info;

	description	 = 	"¿Qué pasa?";
};

func int DIA_Balthasar_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Balthasar_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_HALLO_15_00"); //¿Cómo van las cosas?
	AI_Output			(self, other, "DIA_Balthasar_HALLO_05_01"); //Ah, un rostro nuevo en la granja. ¿Me ha mandado un aprendiz el viejo tacaño?
	AI_Output			(other, self, "DIA_Balthasar_HALLO_15_02"); //No soy un aprendiz.
	AI_Output			(self, other, "DIA_Balthasar_HALLO_05_03"); //Oh, entiendo. Ya no soy tan joven y llevo años esperando un sustituto.
	AI_Output			(self, other, "DIA_Balthasar_HALLO_05_04"); //No habrás venido por las quejas de los vecinos, ¿no?
	

};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	4;
	condition	 = 	DIA_Balthasar_WASMACHSTDU_Condition;
	information	 = 	DIA_Balthasar_WASMACHSTDU_Info;

	description	 = 	"¿A qué te dedicas?";
};

func int DIA_Balthasar_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Balthasar_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Balthasar_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_WASMACHSTDU_15_00"); //¿A qué te dedicas?
	AI_Output			(self, other, "DIA_Balthasar_WASMACHSTDU_05_01"); //Oh, vigilo las ovejas, y llevo haciéndolo desde que tengo memoria.
	AI_Output			(self, other, "DIA_Balthasar_WASMACHSTDU_05_02"); //Los animales son muy leales e inteligentes. Si los tratas bien, te seguirán toda la vida.

};

///////////////////////////////////////////////////////////////////////
//	Info Rangerbandits
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Balthasar_Rangerbandits		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Balthasar_Rangerbandits_Condition;
	information	 = 	DIA_Addon_Balthasar_Rangerbandits_Info;

	description	 = 	"¿Has visto pasar por aquí bandidos?";
};

func int DIA_Addon_Balthasar_Rangerbandits_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Balthasar_HALLO))
	&& (
		(MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)		
		||(SC_KnowsLuciaCaughtByBandits == TRUE)
		)
		{
			return TRUE;
		};
};

func void DIA_Addon_Balthasar_Rangerbandits_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Balthasar_Rangerbandits_15_00"); //¿Has visto pasar por aquí a algún bandido?
	AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_01"); //Claro que sí. Pasaron junto al terreno que hay cerca de la granja de Sekob y entraron en el bosque hacia el norte.
	
	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)	
	{
		AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_02"); //Llevaban montones de armas. Parecían dispuestos a ganar la guerra contra los orcos.
	};
	
	if (SC_KnowsLuciaCaughtByBandits == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_03"); //Si la vista no me falla, también se llevaban al bosque a una chica joven.
		AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_04"); //Espero que la liberaran.
	};
	B_GivePlayerXP (XP_Ambient);
	AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_05"); //Me alegro de que no se acercaran a nuestra granja.
};

///////////////////////////////////////////////////////////////////////
//	Info aergermitnachbarn
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_AERGERMITNACHBARN		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	5;
	condition	 = 	DIA_Balthasar_AERGERMITNACHBARN_Condition;
	information	 = 	DIA_Balthasar_AERGERMITNACHBARN_Info;

	description	 = 	"¿Qué problemas tienes con los vecinos?";
};

func int DIA_Balthasar_AERGERMITNACHBARN_Condition ()
{
	if (
		(Npc_KnowsInfo(other, DIA_Balthasar_WASMACHSTDU))
		&& ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		&& 	(
			((Npc_IsDead(BalthasarSheep1))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep2))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep3))== FALSE)
			)
		)
			{
					return TRUE;
			};
};

func void DIA_Balthasar_AERGERMITNACHBARN_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_AERGERMITNACHBARN_15_00"); //¿Qué problemas tienes con los vecinos?
	AI_Output			(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_01"); //La hierba de este lado del campo siempre está seca y es raquítica. Por eso suelo ir a los prados de los otros granjeros.
	AI_Output			(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_02"); //Al terrateniente no le importa, pero Bengar, el granjero de los prados altos, siempre monta un follón cuando llevo allí los animales.
	AI_Output			(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_03"); //Dice que Sekob debería pagar si llevo los animales a la pradera de Bengar.
	AI_Output			(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_04"); //Pero Sekob no quiere gastarse ni una mísera moneda, y por eso ya no puedo subir a la meseta.
};

///////////////////////////////////////////////////////////////////////
//	Info woBengar
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_WOBENGAR		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	10;
	condition	 = 	DIA_Balthasar_WOBENGAR_Condition;
	information	 = 	DIA_Balthasar_WOBENGAR_Info;

	description	 = 	"¿Dónde puedo encontrar la pradera alta y la granja de Bengar?";
};

func int DIA_Balthasar_WOBENGAR_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Balthasar_AERGERMITNACHBARN))
		&& ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
			{
				return TRUE;
			};
};

func void DIA_Balthasar_WOBENGAR_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_WOBENGAR_15_00"); //¿Dónde puedo encontrar la pradera alta y la granja de Bengar?
	AI_Output			(self, other, "DIA_Balthasar_WOBENGAR_05_01"); //Sigue este camino y cruza la encrucijada grande.
	AI_Output			(self, other, "DIA_Balthasar_WOBENGAR_05_02"); //Si vas por la derecha, verás un gran afloramiento rocoso. Detrás, a la derecha, está la pradera alta y el desfiladero.
};


///////////////////////////////////////////////////////////////////////
//	Info talktoBengar
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_TALKTOBENGAR		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	6;
	condition	 = 	DIA_Balthasar_TALKTOBENGAR_Condition;
	information	 = 	DIA_Balthasar_TALKTOBENGAR_Info;

	description	 = 	"Tal vez debería hablar con Bengar.";
};

func int DIA_Balthasar_TALKTOBENGAR_Condition ()
{
	if (
		(Npc_KnowsInfo(other, DIA_Balthasar_AERGERMITNACHBARN))
		&& ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		&& 	(
			((Npc_IsDead(BalthasarSheep1))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep2))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep3))== FALSE)
			)
		)
			{
					return TRUE;
			};
};

func void DIA_Balthasar_TALKTOBENGAR_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_TALKTOBENGAR_15_00"); //Tal vez debería hablar con Bengar.
	AI_Output			(self, other, "DIA_Balthasar_TALKTOBENGAR_05_01"); //¿Me harías ese favor? ¿Y qué vas a decirle? Bueno, no quiero líos, ¿me oyes?
	AI_Output			(other, self, "DIA_Balthasar_TALKTOBENGAR_15_02"); //Ya veremos.

	Log_CreateTopic (TOPIC_BalthasarsSchafe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BalthasarsSchafe, LOG_RUNNING);
	B_LogEntry (TOPIC_BalthasarsSchafe,"El granjero Bengar ha prohibido a Balthasar, el pastor, que lleve sus ovejas a la pradera alta."); 
	MIS_Balthasar_BengarsWeide = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info Bengarueberredet
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_BENGARUEBERREDET		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	8;
	condition	 = 	DIA_Balthasar_BENGARUEBERREDET_Condition;
	information	 = 	DIA_Balthasar_BENGARUEBERREDET_Info;

	description	 = 	"Puedes volver a llevar las ovejas a la pradera de Bengar.";
};

func int DIA_Balthasar_BENGARUEBERREDET_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Balthasar_TALKTOBENGAR))
		&& (MIS_Balthasar_BengarsWeide == LOG_SUCCESS)
		&& ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		&& 	(
			((Npc_IsDead(BalthasarSheep1))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep2))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep3))== FALSE)
			)
		)
			{
					return TRUE;
			};
};

func void DIA_Balthasar_BENGARUEBERREDET_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_BENGARUEBERREDET_15_00"); //Puedes volver a llevar las ovejas a la pradera de Bengar. Ya he hablado con él.
	AI_Output			(self, other, "DIA_Balthasar_BENGARUEBERREDET_05_01"); //Gracias. Me pondré en camino.
	AI_Output			(self, other, "DIA_Balthasar_BENGARUEBERREDET_05_02"); //Ten, acepta estas pieles de cordero como muestra de mi agradecimiento.

	B_GiveInvItems (self, other, ItAt_SheepFur, 10);  

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"BengarsWeide"); 	

	B_GivePlayerXP (XP_Balthasar_BengarsWeide);

	//Joly: "NW_BIGMILL_FARM3_BALTHASAR"
	
	Wld_InsertNpc	(Sheep,"NW_BIGMILL_FARM3_BALTHASAR"); 
	Wld_InsertNpc	(Sheep,"NW_BIGMILL_FARM3_BALTHASAR"); 
	Wld_InsertNpc	(Hammel,"NW_BIGMILL_FARM3_BALTHASAR"); 

	BalthasarSheep1 = Hlp_GetNpc (Balthasar_Sheep1); 

	if (Hlp_IsValidNpc(BalthasarSheep1))
	&& (!Npc_IsDead(BalthasarSheep1))
		{
			AI_StartState (BalthasarSheep1, ZS_MM_Rtn_Follow_Sheep_Balthasar, 1, "");
		};
	BalthasarSheep2 = Hlp_GetNpc (Balthasar_Sheep2); 

	if (Hlp_IsValidNpc(BalthasarSheep2))
	&& (!Npc_IsDead(BalthasarSheep2))
		{
			AI_StartState (BalthasarSheep2, ZS_MM_Rtn_Follow_Sheep_Balthasar, 1, "");
		};	
	BalthasarSheep3 = Hlp_GetNpc (Balthasar_Sheep3); 

	if (Hlp_IsValidNpc(BalthasarSheep3))
	&& (!Npc_IsDead(BalthasarSheep3))
		{
			AI_StartState (BalthasarSheep3, ZS_MM_Rtn_Follow_Sheep_Balthasar, 1, "");
		};
};

///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	70;
	condition	 = 	DIA_Balthasar_PERMKAP1_Condition;
	information	 = 	DIA_Balthasar_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Va bien todo lo demás?";
};

func int DIA_Balthasar_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Balthasar_WASMACHSTDU)) 
		{
				return TRUE;
		};
};

func void DIA_Balthasar_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_PERMKAP1_15_00"); //¿Va bien todo lo demás?
	
	Npc_PerceiveAll(self);
	if 	(
				(
					( Wld_DetectNpc(self,Balthasar_Sheep1,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
					||( Wld_DetectNpc(self,Balthasar_Sheep2,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
					||( Wld_DetectNpc(self,Balthasar_Sheep3,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
					||( Wld_DetectNpc(self,Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
					||( Wld_DetectNpc(self,Hammel,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
				)
		)
			
				{
					AI_Output			(self, hero, "DIA_Balthasar_PERMKAP1_05_01"); //No me quejo. Gracias por preguntar.
					AI_StopProcessInfos (self);
				}
	else
			{
				AI_Output			(self, hero, "DIA_Balthasar_PERMKAP1_05_02"); //Corren malos tiempos. ¡No encuentro a mis ovejas!
				if (Npc_IsDead(Sekob)== FALSE)
				{
					AI_Output			(self, hero, "DIA_Balthasar_PERMKAP1_05_03"); //Supongo que tendré que confesárselo a Sekob.
				};
				AI_StopProcessInfos (self);
				Npc_ExchangeRoutine	(self,"Start"); //Joly: falls er auf der 2. Weide bei Bengar ist.
			};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Balthasar_PICKPOCKET (C_INFO)
{
	npc			= BAU_932_Balthasar;
	nr			= 900;
	condition	= DIA_Balthasar_PICKPOCKET_Condition;
	information	= DIA_Balthasar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Balthasar_PICKPOCKET_Condition()
{
	C_Beklauen (10, 10);
};
 
FUNC VOID DIA_Balthasar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Balthasar_PICKPOCKET);
	Info_AddChoice		(DIA_Balthasar_PICKPOCKET, DIALOG_BACK 		,DIA_Balthasar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Balthasar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Balthasar_PICKPOCKET_DoIt);
};

func void DIA_Balthasar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Balthasar_PICKPOCKET);
};
	
func void DIA_Balthasar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Balthasar_PICKPOCKET);
};
















