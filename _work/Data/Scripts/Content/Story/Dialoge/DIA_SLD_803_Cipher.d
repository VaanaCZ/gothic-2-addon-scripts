// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Cipher_EXIT(C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 999;
	condition	= DIA_Cipher_EXIT_Condition;
	information	= DIA_Cipher_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cipher_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cipher_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************

instance DIA_Cipher_Hello (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 1;
	condition	= DIA_Cipher_Hello_Condition;
	information	= DIA_Cipher_Hello_Info;
	permanent	= FALSE;
	description = "¿Qué pasa?";
};                       

FUNC INT DIA_Cipher_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Cipher_Hello_Info()
{	
	AI_Output (other, self, "DIA_Cipher_Hello_15_00"); //¿Cómo van las cosas?
	AI_Output (self, other, "DIA_Cipher_Hello_07_01"); //Eh, ¿no te conozco de algún lado?
	AI_Output (other, self, "DIA_Cipher_Hello_15_02"); //Es posible...
	AI_Output (self, other, "DIA_Cipher_Hello_07_03"); //Solía traficar con hierba del pantano en la colonia, ¿te acuerdas?
};

// ************************************************************
// 			  					TradeWhat 
// ************************************************************

instance DIA_Cipher_TradeWhat (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_TradeWhat_Condition;
	information	= DIA_Cipher_TradeWhat_Info;
	permanent	= FALSE;
	description = "¿Y con qué tratas ahora?";
};                       

FUNC INT DIA_Cipher_TradeWhat_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_Hello))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_TradeWhat_Info()
{	
	AI_Output (other, self, "DIA_Cipher_TradeWhat_15_00"); //¿Y ahora con qué traficas?
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_01"); //Ah, no preguntes.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_02"); //Me traje de la colonia minera un buen paquete de hierba del pantano.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_03"); //A muchos de los mercenarios les gusta fumar un poquito de vez en cuando. Por ese lado he ganado una pequeña fortuna.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_04"); //¡Pero algún bastardo ha abierto mi cofre y me ha robado toda la hierba!
	
	Log_CreateTopic (Topic_CipherPaket,LOG_MISSION);
	Log_SetTopicStatus (Topic_CipherPaket,LOG_RUNNING);
	B_LogEntry (Topic_CipherPaket, "Cipher, el mercenario, ha perdido un fardo de hierba del pantano.");
	
	
	if (!Npc_IsDead (Bodo))
	{
		AI_Output (self, other, "DIA_Cipher_TradeWhat_07_05"); //Estoy bastante seguro de que ha sido Bodo. Duerme en la misma habitación que yo y siempre me sonríe como si fuera idiota...
		B_LogEntry (Topic_CipherPaket, "Sospecha que Bodo se lo ha robado.");
	};
	
	MIS_Cipher_Paket = LOG_RUNNING;
};

// ************************************************************
// 			  					DoWithThief 
// ************************************************************

instance DIA_Cipher_DoWithThief (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DoWithThief_Condition;
	information	= DIA_Cipher_DoWithThief_Info;
	permanent	= FALSE;
	description = "¿Entonces qué vas a hacer con el ladrón?";
};                       

FUNC INT DIA_Cipher_DoWithThief_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DoWithThief_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_00"); //Entonces, ¿qué vas a hacer con el ladrón?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_01"); //Uno de estos días voy a pillarle fumándose mi hierba.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_02"); //Y entonces buscaré un lugar solitario para darle una lección que no olvidará.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_03"); //Si le tumbo a la vista de todos, los demás granjeros se darán cuenta y me costaría caro.
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_04"); //¿Y eso?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_05"); //Muy sencillo. Si sacudimos a los granjeros, Lee nos hace pagar una buena multa. Así lo quiere Onar.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_06"); //Y cuantos más testigos haya, más alboroto se monta y más caro sale todo.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_07"); //Así que me encargaré del tema de forma sutil y limpia...
};

// ************************************************************
// 			  					WannaJoin 
// ************************************************************

instance DIA_Cipher_WannaJoin (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_WannaJoin_Condition;
	information	= DIA_Cipher_WannaJoin_Info;
	permanent	= FALSE;
	description = "¡Me quiero unir a la gente de Lee!";
};                       

FUNC INT DIA_Cipher_WannaJoin_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_Hello))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_00"); //¡Me quiero unir a la gente de Lee!
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_01"); //¡¿A la gente de LEE?! ¡Si Lee sigue así no tardarán en dejar de ser suyos!
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_02"); //¿Por qué?
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_03"); //Lee siempre ha sido un tipo tranquilo. También lo era en la colonia.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_04"); //Pero últimamente se está pasando. Se limita a cruzarse de brazos y esperar a que los paladines se mueran de hambre.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_05"); //Sylvio cree que deberíamos aprovecharnos de las granjas pequeñas y de las afueras de la ciudad.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_06"); //Creo que sería un buen cambio.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_07"); //Por el momento, la mayoría de nosotros estamos de brazos cruzados... ¿te quieres unir de todas maneras?
};

// ************************************************************
// 			  					YesJoin 
// ************************************************************

instance DIA_Cipher_YesJoin (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_YesJoin_Condition;
	information	= DIA_Cipher_YesJoin_Info;
	permanent	= FALSE;
	description = "¡Quiero ser uno de vosotros y no me importa cómo!";
};                       

FUNC INT DIA_Cipher_YesJoin_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_YesJoin_Info()
{	
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_00"); //¡Quiero ser uno de vosotros pese a las circunstancias!
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_01"); //¿Ya sabes que tenemos que votar la admisión de todo nuevo recluta?
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_02"); //¿Qué quieres decir con eso?
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_03"); //Bien. Llevo mucho tiempo sin poder fumar nada. Tráeme unos tallos de hierba del pantano y tendrás mi voto.
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_04"); //Seguro que puedes conseguir algo por ahí.
	
	MIS_Cipher_BringWeed = LOG_RUNNING;
	
	Log_CreateTopic (Topic_CipherHerb,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherHerb,LOG_RUNNING);
	B_LogEntry (Topic_CipherHerb,"Cipher me otorgará su voto si le llevo algunos tallos de hierba del pantano.");
};

// ************************************************************
// 			  					Joints 
// ************************************************************

instance DIA_Cipher_Joints (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_Joints_Condition;
	information	= DIA_Cipher_Joints_Info;
	permanent	= TRUE;
	description = "Acerca de la hierba...";
};                       

FUNC INT DIA_Cipher_Joints_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_Joints_Info()
{	
	AI_Output (other, self, "DIA_Cipher_Joints_15_00"); //Con respecto a la hierba del pantano...
	
	if (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Cipher_Joints_07_01"); //¡Has recuperado mi paquete! Ahora todo va a ir bien.
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_07_02"); //Desde luego, voy a votar por ti...
			
			B_LogEntry (TOPIC_SLDRespekt,"Cipher me otorgará su voto cuando me una a los mercenarios.");
		};
		
		MIS_Cipher_BringWeed = LOG_OBSOLETE; //Cipher ist glücklich
	}
	else //normal Running
	{
		Info_ClearChoices (DIA_Cipher_Joints);
		Info_AddChoice (DIA_Cipher_Joints, "Veré lo que puedo hacer...", DIA_Cipher_Joints_Running);
		if (Npc_HasItems (other, itmi_joint) > 0)
		{
			Info_AddChoice (DIA_Cipher_Joints, "Toma unos cuantos tallos.", DIA_Cipher_Joints_Success);
		};
	};
};

func void DIA_Cipher_Joints_Running()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Running_15_00"); //Veré lo que puedo hacer...
	Info_ClearChoices (DIA_Cipher_Joints);
};

func void DIA_Cipher_Joints_Success()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Success_15_00"); //Toma unos cuantos tallos.
	
	if (B_GiveInvItems (other, self, itmi_joint, 10))
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_01"); //¡Ah! ¡Sí señor!
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_02"); //Tienes mi voto.
		};
		MIS_Cipher_BringWeed = LOG_SUCCESS;
		B_LogEntry (TOPIC_SLDRespekt,"Cipher me otorgará su voto cuando me una a los mercenarios.");
		B_GivePlayerXP (XP_CipherWeed);
		
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_03"); //¿Eso es todo? ¡Me la puedo fumar de una sentada!
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_04"); //Tendrán que ser por lo menos 10 cigarros.
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_05"); //De todos modos, cuenta con mi voto.
		};
	};

	Info_ClearChoices (DIA_Cipher_Joints);
};


// ************************************************************
// 			  					TRADE
// ************************************************************

instance DIA_Cipher_TRADE (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_TRADE_Condition;
	information	= DIA_Cipher_TRADE_Info;
	permanent	= TRUE;
	description = "Enséñame tu mercancía.";
	trade		= TRUE;
};                       

FUNC INT DIA_Cipher_TRADE_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_TRADE_Info()
{	
	AI_Output (other, self, "DIA_Cipher_TRADE_15_00"); //Muéstrame tu mercancía.
	if (Npc_HasItems(self, itmi_joint) > 0)
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_01"); //Claro. Sírvete tú mismo.
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_02"); //Ahora mismo no me queda hierba del pantano. ¿Quieres otra cosa?
	};
};

// ************************************************************
// 			  					Dar Dieb
// ************************************************************

instance DIA_Cipher_DarDieb (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DarDieb_Condition;
	information	= DIA_Cipher_DarDieb_Info;
	permanent	= FALSE;
	description = "Sé quién cogió tu hierba.";
};                       

FUNC INT DIA_Cipher_DarDieb_Condition()
{
	if ( (Dar_Dieb == TRUE) || (Dar_Verdacht == TRUE) )
	&& (!Npc_IsDead (Dar))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DarDieb_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_00"); //Sé quién cogió tu hierba.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_01"); //¿Quién? ¿Fue Bodo?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_02"); //No, lo hizo uno de los mercenarios, Dar.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_03"); //Ese bastardo, ¿dónde está?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_04"); //Encontrarle no te servirá de nada, ya no tiene el paquete. Lo ha vendido en Khorinis.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_05"); //¿¡¿DÓNDE ESTÁ?!?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_06"); //Detrás del edificio de las cocinas, en la esquina...
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_07"); //¡ME LO VOY A CARGAR!
	
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack (self, Dar, AR_NONE, 0);
};

// ************************************************************
// 			  					Dar LOST
// ************************************************************

instance DIA_Cipher_DarLOST (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DarLOST_Condition;
	information	= DIA_Cipher_DarLOST_Info;
	permanent	= FALSE;
	description = "Desde luego has hecho que Dar lo pague... ¿te sientes mejor?";
};                       

FUNC INT DIA_Cipher_DarLOST_Condition()
{
	if (Dar_LostAgainstCipher == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DarLOST_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_00"); //Desde luego has hecho que Dar lo pague... ¿te sientes mejor?
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_01"); //(Suspira) Claro, me ha sentado bien.
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_02"); //A ÉL no tanto, supongo...
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_03"); //¡Al desgraciado no se le había perdido nada en mi cofre!
	
	B_GivePlayerXP ((XP_Ambient)*2);
};

// ************************************************************
// 			  				Kraut PAKET
// ************************************************************

instance DIA_Cipher_KrautPaket (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_KrautPaket_Condition;
	information	= DIA_Cipher_KrautPaket_Info;
	permanent	= FALSE;
	description = "¿Este paquete de hierba no será tuyo?";
};                       

FUNC INT DIA_Cipher_KrautPaket_Condition()
{
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	&& (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_KrautPaket_Info()
{	
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_00"); //¿Este paquete de hierba del pantano no será tuyo?
	B_GiveInvItems (other, self, ItMi_HerbPaket, 1);
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_01"); //¡Caramba! ¿Dónde lo has encontrado?
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_02"); //Es una larga historia...
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_03"); //En realidad no importa, eres buen tipo.
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_04"); //Toma esto a modo de recompensa. ¡Y disfruta!
	B_GiveInvItems (self, other, itmi_gold, 200);
	B_GiveInvItems (self, other, itmi_joint, 10);
	B_GivePlayerXP (XP_Cipher_KrautPaket);
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_05"); //Déjame liar unos...
	CreateInvItems (self, itmi_joint, 40);
	Npc_RemoveInvItems (self, ItMi_HerbPaket, 1);
	
	MIS_Cipher_Paket = LOG_SUCCESS;
	B_GivePlayerXP (XP_CipherPaket);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_CipherSLD_PICKPOCKET (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 900;
	condition	= DIA_CipherSLD_PICKPOCKET_Condition;
	information	= DIA_CipherSLD_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_CipherSLD_PICKPOCKET_Condition()
{
	C_Beklauen (65, 65);
};
 
FUNC VOID DIA_CipherSLD_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_CipherSLD_PICKPOCKET);
	Info_AddChoice		(DIA_CipherSLD_PICKPOCKET, DIALOG_BACK 		,DIA_CipherSLD_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_CipherSLD_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_CipherSLD_PICKPOCKET_DoIt);
};

func void DIA_CipherSLD_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cipher_PICKPOCKET);
};
	
func void DIA_CipherSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Cipher_PICKPOCKET);
};


		



		
	
//#####################################################################
//##
//##
//##						Bis - KAPITEL 3 - (danach in OW!)
//##
//##
//#####################################################################
	

	



	
/**/
