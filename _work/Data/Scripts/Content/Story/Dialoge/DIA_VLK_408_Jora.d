///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jora_EXIT   (C_INFO)
{
	npc         = VLK_408_Jora;
	nr          = 999;
	condition   = DIA_Jora_EXIT_Condition;
	information = DIA_Jora_EXIT_Info;
	permanent   = TRUE;
	description = "¡Tengo que irme!";
};

FUNC INT DIA_Jora_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jora_EXIT_Info()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Jora_EXIT_08_00"); //¡Ey! ¿Qué pasa con mi dinero?
	};
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_Sperre		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_Sperre_Condition;
	information	 = 	DIA_Jora_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Jora_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self,ZS_Talk ))
	{
		return TRUE;
	};
};
func void DIA_Jora_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Jora_Sperre_08_00"); //Eres un convicto de la colonia de mineros. ¡No voy a venderte nada!
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_WAREZ		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	700;
	condition	 = 	DIA_Jora_WAREZ_Condition;
	information	 = 	DIA_Jora_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Enséñame tu mercancía.";
};
func int DIA_Jora_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Jora_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Jora_WAREZ_15_00"); //Enséñame tu mercancía.
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_GREET		(C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 1;
	condition	= DIA_Jora_GREET_Condition;
	information	= DIA_Jora_GREET_Info;
	permanent 	= FALSE;
	important	= TRUE;
};
func int DIA_Jora_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Canthar_Sperre == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GREET_Info ()
{
	AI_Output (self, other, "DIA_Jora_GREET_08_00"); //Que Innos te acompañe, extraño. Si estás buscando una buena selección para el viajero, estás en el lugar adecuado.
	AI_Output (self, other, "DIA_Jora_GREET_08_01"); //Pero te aviso: si planeas servirte tú mismo y no pagar, ¡llamaré a la guardia de la ciudad!
	AI_Output (other, self, "DIA_Jora_GREET_15_02"); //Espera un momento. ¿Tengo pinta de ladrón?
	AI_Output (self, other, "DIA_Jora_GREET_08_03"); //(Desdeñoso) ¡Bah! Hoy no serías el primero en largarse con mis cosas.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Jora comercia con todo tipo de armas en el mercado.");
};

// *******************************************************
// 					Du bestohlen?
// *******************************************************
instance DIA_Jora_Bestohlen	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Bestohlen_Condition;
	information	 = 	DIA_Jora_Bestohlen_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Alguien te ha robado?";
};
func int DIA_Jora_Bestohlen_Condition ()
{
	return TRUE;
};
func void DIA_Jora_Bestohlen_Info ()
{
	AI_Output (other, self, "DIA_Jora_Bestohlen_15_00"); //¿Alguien te ha robado?
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_01"); //No puedo demostrarlo. El tipo era muy listo. Se presentó como Rengaru, si ése es su nombre auténtico.
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_02"); //Ha estado merodeando por el mercado durante los últimos días.
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Bestohlen_08_03"); //Y todas las noches se coge una buena en el puesto de cerveza que hay más abajo. ¡Apuesto a que el bastardo se está bebiendo MI dinero!
	};
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_04"); //¡Solo aparté la mirada un momento y mi bolso había desaparecido!
};


// ******************
// B_Jora_GoldForClue
// ******************

func void B_Jora_GoldForClue()
{
	AI_Output (self ,other,"DIA_Jora_Add_08_04"); //Escucha: si recuperas mi oro de ese tal Rengaru, te diré lo que sé.
};


// *******************************************************
// 					Ich hol dir dein Gold
// *******************************************************
instance DIA_Jora_HolDeinGold	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_HolDeinGold_Condition;
	information	 = 	DIA_Jora_HolDeinGold_Info;
	permanent	 = 	FALSE;
	description	 = 	"Podría recuperar tu oro.";
};
func int DIA_Jora_HolDeinGold_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Jora_Bestohlen))
	{
		return TRUE;
	};
};
func void DIA_Jora_HolDeinGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_15_00"); //Podría recuperar tu oro.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_01"); //(Desconfiado) ¿Eh? ¿Y por qué ibas a hacerlo?

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice 		(DIA_Jora_HolDeinGold,"¡Quiero parte del oro como recompensa!",DIA_Jora_HolDeinGold_WillBelohnung);
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"¡Busco pistas sobre la cofradía de ladrones!", DIA_Jora_HolDeinGold_GHDG);
	};
	if (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"Eso depende. ¿Puedes ayudarme a llegar al barrio alto?", DIA_Jora_HolDeinGold_ToOV);
	};
};

func void DIA_Jora_HolDeinGold_ToOV()
{
	AI_Output (other, self,"DIA_Jora_Add_15_00"); //Eso depende. ¿Puedes ayudarme a llegar al barrio alto?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_03"); //(Se ríe) Estás con el hombre equivocado. No soy de la ciudad, como la mayoría de los mercaderes del mercado.
	AI_Output (self ,other,"DIA_Jora_Add_08_01"); //Si quieres entrar en el barrio alto, ve a hablar con los mercaderes residentes de la parte baja de la ciudad.
};

func void DIA_Jora_HolDeinGold_GHDG()
{
	AI_Output (other, self,"DIA_Jora_Add_15_02"); //¡Busco pistas sobre la cofradía de ladrones!
	AI_Output (self ,other,"DIA_Jora_Add_08_03"); //Podría ayudarte.
	B_Jora_GoldForClue();

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Veré lo que puedo hacer.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"¿Cuánto oro había en esa bolsa?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"¿Por qué no llamaste a la guardia de la ciudad?",DIA_Jora_HolDeinGold_Wache);	
};

func void DIA_Jora_HolDeinGold_WillBelohnung()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_WillBelohnung_15_00"); //¡Quiero parte del oro como recompensa!
	AI_Output (self, other, "DIA_Jora_HolDeinGold_WillBelohnung_08_01"); //Primero veamos si recuperas mi bolsa. ¡LUEGO hablaremos de tu recompensa!
	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Veré lo que puedo hacer.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"¿Cuánto oro había en esa bolsa?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"¿Por qué no llamaste a la guardia de la ciudad?",DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_Wache()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_Wache_15_00"); //¿Por qué no llamaste a la guardia de la ciudad?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_01"); //Los guardias solo responden si se pilla al ladrón in fraganti.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_02"); //Y cuando me di cuenta de que me faltaba la bolsa, ¡el bastardo ya se había ido!
};

func void DIA_Jora_HolDeinGold_HowMuch()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_HowMuch_15_00"); //¿Cuánto oro había en esa bolsa?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_HowMuch_08_01"); //50 monedas de oro. Es bastante, en estos tiempos que corren.
};

func void DIA_Jora_HolDeinGold_DoIt()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_00"); //Veré lo que puedo hacer.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_01"); //¡Ten cuidado! Si tumbas al muy bastardo, la guardia de la ciudad se verá involucrada.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_02"); //Las cosas se están poniendo bastante complicadas últimamente por aquí. Desde que los paladines llegaron a la ciudad, los guardias han estado dando mucha caña a los alborotadores.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_03"); //Así que piensa en algo...
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_04"); //Lo haré.
		
	Jora_Dieb = LOG_RUNNING;
	Jora_Gold = LOG_RUNNING;
	
	Log_CreateTopic (Topic_JoraDieb,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JoraDieb,LOG_RUNNING);
	Log_CreateTopic (TOPIC_Jora,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jora,LOG_RUNNING);
	
	B_LogEntry (TOPIC_Jora, "Un tipo llamado Rengaru robó a Jora, la mercader. Pasó días en el mercado.");
	B_LogEntry (TOPIC_Jora, "Tengo que recuperar el oro de Jora.");
	B_LogEntry (TOPIC_JoraDieb, "Rengaru robó a Jora, la mercader. Si me topo con él, puedo hacerme con una buena recompensa.");

	Info_ClearChoices 	(DIA_Jora_HolDeinGold);
};

// *******************************************************
// 					Wegen Dieb...
// *******************************************************
instance DIA_Jora_WegenDieb	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_WegenDieb_Condition;
	information	 = 	DIA_Jora_WegenDieb_Info;
	permanent	 = 	TRUE;
	description	 = 	"Sobre el ladrón...";
};
func int DIA_Jora_WegenDieb_Condition ()
{
	if (Jora_Dieb == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_WegenDieb_Info ()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_15_00"); //Sobre el ladrón...
	AI_Output (self, other, "DIA_Jora_WegenDieb_08_01"); //Sí, ¿cómo va la cosa? ¿Lo has atrapado? y, lo más importante, ¿tienes mi oro?
	
	Info_ClearChoices (DIA_Jora_WegenDieb);
	
	if (Npc_IsDead (Rengaru))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"Bueno, se encontró con un accidente fatal.",DIA_Jora_WegenDieb_Tot);
	}
	else if (Rengaru_InKnast == TRUE)
	{	
		Info_AddChoice (DIA_Jora_WegenDieb,"Sí, le pillé.",DIA_Jora_WegenDieb_ImKnast);
	}
	else if (Npc_KnowsInfo (other, DIA_Rengaru_HALLODIEB))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"Se me escapó.",DIA_Jora_WegenDieb_Entkommen);
	};
	
	Info_AddChoice (DIA_Jora_WegenDieb,"¡Aún estoy en ello!",DIA_Jora_WegenDieb_Continue);
};

func void DIA_Jora_WegenDieb_Continue()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Continue_15_00"); //¡Aún estoy en ello!
	AI_Output (self, other, "DIA_Jora_WegenDieb_Continue_08_01"); //¡Asegúrate de recuperar mi oro!
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Entkommen()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Entkommen_15_00"); //Se me escapó.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Entkommen_08_01"); //¿Y qué hay de mi oro? ¿Se lo llevó con él?
	Jora_Dieb = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);

};

func void DIA_Jora_WegenDieb_ImKnast()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_ImKnast_15_00"); //Sí, le pillé. Va a refrescarse las posaderas en la cárcel durante una temporada.
	AI_Output (self, other, "DIA_Jora_WegenDieb_ImKnast_08_01"); //¿Qué hay de mi oro?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Tot()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Tot_15_00"); //Bueno, se encontró con un accidente fatal.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_01"); //¡Entonces al menos no robará a nadie más! La justicia de Innos ha prevalecido.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_02"); //¿Dónde está mi oro?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};


// *******************************************************
// 					Gold zurückbringen
// *******************************************************
instance DIA_Jora_BringGold (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BringGold_Condition;
	information	 = 	DIA_Jora_BringGold_Info;
	permanent	 = 	TRUE;
	description	 = 	"Aquí tienes las 50 monedas de oro que te robó.";
};

func int DIA_Jora_BringGold_Condition ()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_BringGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_BringGold_15_00"); //Aquí tienes las 50 monedas de oro que te robó.
	
	if (B_GiveInvItems (other, self, itmi_gold, 50))
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_01"); //¡Alabado sea Innos! Aún hay justicia en la ciudad.
	
		Jora_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Jora_Gold);
	}
	else
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_03"); //¡Oye, esto no son 50 monedas de oro! ¿Tú también intentas robarme?
	};
};

// *******************************************************
// 					GHDG Info
// *******************************************************

var int Jora_GhdgHinweis;
// ----------------------

instance DIA_Jora_GHDgInfo (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_GHDgInfo_Condition;
	information	 = 	DIA_Jora_GHDgInfo_Info;
	permanent	 = 	TRUE;
	description	 = 	"¿Qué sabes de la cofradía de ladrones?";
};

func int DIA_Jora_GHDgInfo_Condition ()
{
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jora_Bestohlen))
	&& (Jora_GhdgHinweis == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GHDgInfo_Info ()
{
	AI_Output (other, self,"DIA_Jora_Add_15_05"); //¿Qué sabes de la cofradía de ladrones?
	if (Jora_Gold != LOG_SUCCESS)
	{
		B_Jora_GoldForClue();
	}
	else
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_06"); //Muy bien, atiende: yo no te he dicho nada de lo que estás a punto de oír, ¿comprendes?
		AI_Output (self ,other,"DIA_Jora_Add_08_07"); //Hay personajes sospechosos que frecuentan la taberna junto al puerto.
		AI_Output (self ,other,"DIA_Jora_Add_08_08"); //Supongo que el dueño sabe un par de cosas...
		AI_Output (self ,other,"DIA_Jora_Add_08_09"); //Si planeas encontrar a los ladrones, deberías ir a hablar con ÉL.
		AI_Output (self ,other,"DIA_Jora_Add_08_10"); //Podrías pretender que te traes algo deshonesto entre manos, por ejemplo. Quizá se lo trague.
		AI_Output (self ,other,"DIA_Jora_Add_08_11"); //Pero ten mucho cuidado. No se debe jugar con esa gente.
		
		Jora_GhdgHinweis = TRUE;
	};
};

// *******************************************************
// 						Belohnung
// *******************************************************
instance DIA_Jora_Belohnung (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Belohnung_Condition;
	information	 = 	DIA_Jora_Belohnung_Info;
	permanent	 = 	FALSE;
	description	 = 	"¡Quiero parte del oro como recompensa!";
};

func int DIA_Jora_Belohnung_Condition ()
{
	if (Jora_Gold == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Jora_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Jora_Belohnung_15_00"); //¡Quiero parte del oro como recompensa!
	if (Jora_GhdgHinweis == TRUE)
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_12"); //Pero ya te he dado una pista valiosa.
		AI_Output (self ,other,"DIA_Jora_Add_08_13"); //Eso debería bastarte como recompensa.
	};
	AI_Output (self ,other,"DIA_Jora_Add_08_14"); //Si lo que quieres es oro, encuentra a los ladrones y recupera el botín de lord Andre.
	
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Belohnung_08_03"); //Ahora debo volver con mis clientes...
	};
	AI_StopProcessInfos (self); 
};

// *****************************************************
// 				Nach Alriks Schwert fragen
// *****************************************************
instance DIA_Jora_AlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_AlriksSchwert_Condition;
	information	 = 	DIA_Jora_AlriksSchwert_Info;
	permanent	 = 	FALSE;
	description	 = 	"Alrik dice que tienes su espada...";
};
func int DIA_Jora_AlriksSchwert_Condition ()
{
	if (MIS_Alrik_Sword == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_AlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_00"); //Alrik dice que tienes su espada...
	AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_01"); //¿Dices ese tipo andrajoso que me cambió su arma por unas cuantas antorchas y unos pedazos de carne?
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_02"); //Ése mismo.
	
	if (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_03"); //Aún tengo la espada.
		AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_04"); //¿Cuánto quieres por ella?
		if (Jora_Gold == LOG_SUCCESS) 
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_05"); //Bueno, para ti...
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_06"); //Ah, ¡y qué! Bueno, tómala. Después de todo, me ayudaste a recuperar mi oro...
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		}
		else
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_07"); //Bueno, por ser para ti, 50 monedas de oro.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_08"); //(Gruñendo) ¡Ya no la tengo! Solo el demonio sabe dónde estará ahora.
	};
};


// *****************************************************
// 				Alriks Schwert KAUFEN
// *****************************************************
instance DIA_Jora_BUYAlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BUYAlriksSchwert_Condition;
	information	 = 	DIA_Jora_BUYAlriksSchwert_Info;
	permanent	 = 	TRUE;
	description	 = 	"Aquí tienes 50 monedas de oro. Así que dame la espada de Alrik.";
};
func int DIA_Jora_BUYAlriksSchwert_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jora_AlriksSchwert))
	&& (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};
};
func void DIA_Jora_BUYAlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_00"); //Aquí tienes 50 monedas de oro. Así que dame la espada de Alrik.

	if (B_GiveInvItems(other,self,itmi_gold,50))
	{
		//if (Jora_Gold == LOG_RUNNING)
		//{
			//AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_02"); //Moment, ich wollte das Schwert kaufen...
			//AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_03"); //Das kannst du doch immer noch tun - für 50 Goldstücke ist es deins...
			//Jora_Gold = LOG_SUCCESS;
		//}
		//else
		//{
			AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_04"); //Aquí tienes. (Con astucia) Ha sido un buen trato.
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		//};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_05"); //No tienes bastante oro. Pero no te preocupes. Te guardaré la espada durante un tiempo. Vuelve otro día...
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jora_PICKPOCKET (C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 900;
	condition	= DIA_Jora_PICKPOCKET_Condition;
	information	= DIA_Jora_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Jora_PICKPOCKET_Condition()
{
	C_Beklauen (31, 45);
};
 
FUNC VOID DIA_Jora_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jora_PICKPOCKET);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_BACK 		,DIA_Jora_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jora_PICKPOCKET_DoIt);
};

func void DIA_Jora_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};
	
func void DIA_Jora_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};









