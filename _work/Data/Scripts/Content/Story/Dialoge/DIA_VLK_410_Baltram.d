///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Baltram_EXIT   (C_INFO)
{
	npc         = VLK_410_Baltram;
	nr          = 999;
	condition   = DIA_Baltram_EXIT_Condition;
	information = DIA_Baltram_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Baltram_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Baltram_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////AUSKOMMENTIERT WEGEN ADDON M.F. (Missionen passen nicht mehr, Spielfluß hemmend)
//	Info Sperre
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Baltram_Sperre		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	1;
	condition	 = 	DIA_Baltram_Sperre_Condition;
	information	 = 	DIA_Baltram_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Baltram_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self, ZS_Talk ))
	&& ((!Npc_KnowsInfo (other, DIA_Addon_Baltram_LaresAbloese))
	|| (SCIsWearingRangerRing == FALSE))
	{
		return TRUE;
	};
};
func void DIA_Baltram_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Baltram_Sperre_01_00"); //Was willst du? Du bist ein Sträfling aus der Minenkolonie. Mit dir mache ich keine Geschäfte!
	AI_StopProcessInfos (self);	 
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Hallo		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	2;
	condition	 = 	DIA_Baltram_Hallo_Condition;
	information	 = 	DIA_Baltram_Hallo_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Baltram_Hallo_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	//&& (Canthar_Sperre == FALSE)
	&& (MIS_Nagur_Bote == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Baltram_Hallo_Info ()
{
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Baltram_Hallo_01_00"); //Bienvenido, extraño, mi nombre es Baltram. ¿Has venido a abastecerte de comida?
		AI_Output (self, other, "DIA_Baltram_Hallo_01_01"); //Me temo que no podré satisfacerte. No tengo mucho surtido en este momento.
		AI_Output (self, other, "DIA_Baltram_Hallo_01_02"); //Pero recibiré pronto un nuevo envío.
	}
	else
	{
		AI_Output (self, other, "DIA_Baltram_Hallo_01_03"); //Si has venido a comprarme comida, puedes volver por donde has venido.
		AI_Output (self, other, "DIA_Baltram_Hallo_01_04"); //¡No tengo muy buena opinión de vosotros los mercenarios! No me causáis más que problemas.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LaresAbloese
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_LaresAbloese		(C_INFO)
{
	npc		 	= VLK_410_Baltram;
	nr		 	= 1;
	condition	= DIA_Addon_Baltram_LaresAbloese_Condition;
	information	= DIA_Addon_Baltram_LaresAbloese_Info;

	important 	= TRUE;
};

func int DIA_Addon_Baltram_LaresAbloese_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (SCIsWearingRangerRing == TRUE)
	&& (MIS_Lares_BringRangerToMe == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_LaresAbloese_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_00"); //¿Por qué dudas tanto?
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_01"); //Veo que llevas el símbolo del 'Anillo de Agua'.
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_02"); //¿Tú también eres miembro?
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_03"); //¿Y qué si lo soy?
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_04"); //Que te diría que Lares quiere que alguien le releve en su puesto del puerto.
	AI_Output	(self, other, "DIA_Addon_Baltram_LaresAbloese_01_05"); //Bien. Si es así, me ocuparé de que alguien lo sustituya.
	AI_Output	(other, self, "DIA_Addon_Baltram_LaresAbloese_15_06"); //Entiendo.
	B_GivePlayerXP (XP_Ambient);

	B_LogEntry (TOPIC_Addon_BringRangerToLares,"Baltram, comerciante del mercado, se ocupará de que Lares se calme. Quizá Lares pueda irse del puerto ENSEGUIDA."); 

	SC_KnowsBaltramAsRanger = TRUE;
	Baltram_Exchange4Lares = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Job
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Job		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	3;
	condition	 = 	DIA_Baltram_Job_Condition;
	information	 = 	DIA_Baltram_Job_Info;
	permanent	 =  FALSE;
	description  =  "¿Tienes trabajo para mí?";
};
func int DIA_Baltram_Job_Condition ()
{
	if (MIS_Nagur_Bote != LOG_RUNNING)
	&& (MIS_Nagur_Bote != LOG_SUCCESS)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Baltram_Job_Info ()
{
	AI_Output (other, self, "DIA_Baltram_Job_15_00"); //¿Tienes trabajo para mí?
	AI_Output (self, other, "DIA_Baltram_Job_01_01"); //No, ya tengo un chico de los recados. Prueba con los otros comerciantes.
};
///////////////////////////////////////////////////////////////////////
//	Info Trick
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Trick		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	4;
	condition	 = 	DIA_Baltram_Trick_Condition;
	information	 = 	DIA_Baltram_Trick_Info;
	permanent	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Baltram_Trick_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_Nagur_Bote == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Baltram_Trick_Info ()
{
	AI_Output (self, other, "DIA_Baltram_Trick_01_00"); //¿Buscas trabajo?
	AI_Output (other, self, "DIA_Baltram_Trick_15_01"); //Claro, ¿de qué va?
	AI_Output (self, other, "DIA_Baltram_Trick_01_02"); //Mi chico de los recados no ha vuelto y estoy esperando un envío del granjero Akil.
	AI_Output (other, self, "DIA_Baltram_Trick_15_03"); //¿Y cuánto vale para ti?
	AI_Output (self, other, "DIA_Baltram_Trick_01_04"); //Te daré 50 monedas de oro.
	AI_Output (other, self, "DIA_Baltram_Trick_15_05"); //De acuerdo, acepto.
	AI_Output (self, other, "DIA_Baltram_Trick_01_06"); //Vale, dile a Akil que te he enviado yo. Te dará un paquete. Tráemelo.
	
	MIS_Baltram_ScoutAkil = LOG_RUNNING;
	B_LogEntry (TOPIC_Nagur,"Baltram me ha empleado como recadero. Ahora tengo que recoger un envío en la granja de Akil.");
	
	Log_CreateTopic (TOPIC_Baltram,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Baltram,LOG_RUNNING);
	B_LogEntry (TOPIC_Baltram, "Si le llevo a Baltram su encargo, me pagará 50 monedas de oro.");
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
var int Baltram_TradeLOG;
// --------------------------------------------------------------
instance DIA_Baltram_WAREZ		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 = 	2;
	condition	 = 	DIA_Baltram_WAREZ_Condition;
	information	 = 	DIA_Baltram_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Enséñame tu mercancía.";
};

func int DIA_Baltram_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Baltram_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self,"DIA_Baltram_WAREZ_15_00"); //Enséñame tu mercancía.
	
	if (Baltram_TradeLOG == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Baltram comercia con comida en el mercado.");
		Baltram_TradeLOG = TRUE;
	};
	
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_01"); //No deberían haber permitido que llegara tan lejos. Ahora uno de los mercenarios resulta que ha asesinado a un paladín.
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_02"); //¡Tenía que pasar algo así tarde o temprano!
	};
	if ((MIS_BaltramTrade != LOG_SUCCESS)
	&& ((hero.guild == GIL_SLD)
	||  (hero.guild == GIL_DJG)))
	{
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_03"); //La gente como tú no obtendrá nada de mí.
		AI_Output (other, self,"DIA_Baltram_WAREZ_15_04"); //¿Por qué?
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_05"); //Primero agitas a los granjeros y luego actúas como si no hubiera pasado nada.
		AI_Output (self ,other,"DIA_Baltram_WAREZ_01_06"); //Ahora lárgate, estás espantando a mis clientes.
		
		MIS_BaltramTrade = LOG_FAILED;
		
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Skip
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_Skip		(C_INFO)
{
	npc		 = 	VLK_410_Baltram;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Baltram_Skip_Condition;
	information	 = 	DIA_Addon_Baltram_Skip_Info;

	description	 = 	"¿Comercias con piratas?";
};

func int DIA_Addon_Baltram_Skip_Condition ()
{
	if (SCKnowsBaltramAsPirateTrader == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Baltram_Skip_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_Skip_15_00"); //(con indiferencia) ¿Haces negocios con piratas?
	AI_Output	(self, other, "DIA_Addon_Baltram_Skip_01_01"); //(descubierto) ¿Qué? ¿Quién te ha dicho eso?
	AI_Output	(other, self, "DIA_Addon_Baltram_Skip_15_02"); //He hablado con uno de ellos. Creo que te está esperando en el muelle.
	AI_Output	(self, other, "DIA_Addon_Baltram_Skip_01_03"); //¿Qué puedo hacer? Corren tiempos difíciles. Cada uno tiene que intentar subsistir.
	
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "¿No tenías miedo de que te atraparan?", DIA_Addon_Baltram_Skip_erwischen );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "¡Pagarás las consecuencias de esto!", DIA_Addon_Baltram_Skip_MIL );
};
func void DIA_Addon_Baltram_Skip_Back ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_Back_15_00"); //Eso es todo lo que quería saber.
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
};

func void DIA_Addon_Baltram_Skip_MIL ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_MIL_15_00"); //¡Pagarás las consecuencias de esto!
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_MIL_01_01"); //Eh, escucha. Te diré todo lo que sé y, a cambio, tú no me delatas, ¿de acuerdo?
	
	Info_ClearChoices (DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "¿Qué es lo que comercias?", DIA_Addon_Baltram_Skip_was );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "¿Qué sabes sobre los piratas?", DIA_Addon_Baltram_Skip_pirat );
};

func void DIA_Addon_Baltram_Skip_erwischen ()
{
	AI_Output (other, self, "DIA_Addon_Baltram_Skip_erwischen_15_00"); //¿No tenías miedo de que te atraparan?
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_erwischen_01_01"); //Todo puede pasar. Tú me has descubierto, ¿no?
	AI_Output (self, other, "DIA_Addon_Baltram_Skip_erwischen_01_02"); //Pero vas a mantener la boca cerrada, ¿vale?
	
	Info_ClearChoices	(DIA_Addon_Baltram_Skip);
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "¿Qué es lo que comercias?", DIA_Addon_Baltram_Skip_was );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "¿Qué sabes sobre los piratas?", DIA_Addon_Baltram_Skip_pirat );
};

func void DIA_Addon_Baltram_Skip_was ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_was_15_00"); //(brusco) ¿Qué es lo que comercias?
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_was_01_01"); //Sobre todo les proporciono comida.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_was_01_02"); //Y, a cambio, ellos me traen el mejor ron que hay en todo Khorinis.
	
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Eso es todo lo que quería saber.", DIA_Addon_Baltram_Skip_Back );
	Info_AddChoice	(DIA_Addon_Baltram_Skip, "Podría ocuparme del trato por ti.", DIA_Addon_Baltram_Skip_Ich );
};

func void DIA_Addon_Baltram_Skip_Ich ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_Ich_15_00"); //(sonríe) Yo podría ocuparme esta vez del trueque.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_01"); //Sería fantástico. No puedo irme de Khorinis ahora mismo.
	CreateInvItems (self, ItMi_Packet_Baltram4Skip_Addon, 1);									
	B_GiveInvItems (self, other, ItMi_Packet_Baltram4Skip_Addon, 1);		
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_02"); //Toma, coge este paquete y dile a Skip que esta vez no sea tan tacaño con el ron.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_Ich_01_03"); //Quiero al menos 3 botellas.
	
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Baltram me ha dado un paquete. Debo llevárselo a Skip."); 
	
	MIS_Addon_Baltram_Paket4Skip = LOG_RUNNING;
};

func void DIA_Addon_Baltram_Skip_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Baltram_Skip_pirat_15_00"); //(brusco) ¿Qué sabes sobre los piratas?
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_01"); //(deprisa) Viven en una zona lejana de la isla de Khorinis.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_02"); //Sólo se puede llegar con algún tipo de embarcación, por lo que sé.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_03"); //Los ciudadanos de Khorinis les temen. Y con razón, porque no son más que un puñado de asesinos.
	AI_Output			(self, other, "DIA_Addon_Baltram_Skip_pirat_01_04"); //Aún así, si quieres mi opinión, son mucho más temibles los bandidos.
};

///////////////////////////////////////////////////////////////////////
//	Info SkipsRum
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_SkipsRum		(C_INFO)
{
	npc		 = 	VLK_410_Baltram;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Baltram_SkipsRum_Condition;
	information	 = 	DIA_Addon_Baltram_SkipsRum_Info;

	description	 = 	"Tengo el ron para Skip.";
};

func int DIA_Addon_Baltram_SkipsRum_Condition ()
{
	
	if (Skip_Rum4Baltram == TRUE)
	&& (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems (other,ItFo_Addon_Rum) >= 2)
		{
			return TRUE;
		};
};

func void DIA_Addon_Baltram_SkipsRum_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Baltram_SkipsRum_15_00"); //Tengo ron de Skip. Pero sólo me ha dado 2 botellas.
	AI_Output	(self, other, "DIA_Addon_Baltram_SkipsRum_01_01"); //(enfadado) Menudo carero. ¿Quién se ha creído que es? Bueno, dámelas.
	B_GiveInvItems (other, self, ItFo_Addon_Rum,2); 
	AI_Output	(self, other, "DIA_Addon_Baltram_SkipsRum_01_02"); //No puedo darte mucho ahora. Tendrá que valerte con esto.
	CreateInvItems (self, ItMi_Gold, 10);									
	B_GiveInvItems (self, other, ItMi_Gold, 10);		

	TOPIC_END_BaltramSkipTrade = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_AkilsHof		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  4;
	condition	 = 	DIA_Baltram_AkilsHof_Condition;
	information	 = 	DIA_Baltram_AkilsHof_Info;
	permanent	 =  FALSE;
	description	 = 	"¿Dónde puedo encontrar la granja de Akil?";
};
func int DIA_Baltram_AkilsHof_Condition ()
{
	if (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Baltram_AkilsHof_Info ()
{
	AI_Output (other, self, "DIA_Baltram_AkilsHof_15_00"); //¿Dónde puedo encontrar la granja de Akil?
	AI_Output (self, other, "DIA_Baltram_AkilsHof_01_01"); //Sal derecho por la puerta este y sigue el camino hacia el sureste.
	AI_Output (self, other, "DIA_Baltram_AkilsHof_01_02"); //Después de un trecho, llegarás a una escalera de piedra. Sube y desde allí ya podrás ver la granja de Akil.
};
///////////////////////////////////////////////////////////////////////
//	Info Lieferung geholt
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Lieferung	(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  5;
	condition	 = 	DIA_Baltram_Lieferung_Condition;
	information	 = 	DIA_Baltram_Lieferung_Info;
	permanent 	 =  FALSE;
	description	 = 	"Tengo el envío de Akil.";
};

func int DIA_Baltram_Lieferung_Condition ()
{
	if (Npc_HasItems (other, ItMi_BaltramPaket) >=1)
	{
		return TRUE;
	};
};
func void DIA_Baltram_Lieferung_Info ()
{
	AI_Output (other, self, "DIA_Baltram_Lieferung_15_00"); //Tengo el envío de Akil.
	AI_Output (self, other, "DIA_Baltram_Lieferung_01_01"); //Excelente. Por fin puedo volver a ofrecer productos frescos. Aquí tienes tus 50 monedas de oro.
	
	B_GiveInvItems (other, self, ItMi_BaltramPaket,1);
	B_GiveInvItems (self, other, ItMi_Gold,50);
	
	MIS_Baltram_ScoutAkil = LOG_SUCCESS;
	MIS_Nagur_Bote = LOG_FAILED;
	B_GivePlayerXP (XP_Baltram_ScoutAkil);
	
	Npc_RemoveInvItems (self, ItMi_BaltramPaket,1);
	
	CreateInvItems (self,ItFo_Cheese	,  5); 	
	CreateInvItems (self,ItFo_Apple 	, 10); 
	CreateInvItems (self,ItFo_Beer  	,  5);
	CreateInvItems (self,ItFo_Bacon 	,  5);
	CreateInvItems (self,ItFo_Sausage	,  5);
	
};

///////////////////////////////////////////////////////////////////////
//	Info LetUsTrade
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_LetUsTrade		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  6;
	condition	 = 	DIA_Baltram_LetUsTrade_Condition;
	information	 = 	DIA_Baltram_LetUsTrade_Info;
	permanent	 =  FALSE;
	description	 = 	"¿No podríamos hacer negocios juntos, después de todo?";
};
func int DIA_Baltram_LetUsTrade_Condition ()
{
	if (MIS_BaltramTrade == LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Baltram_LetUsTrade_Info ()
{
	AI_Output (other, self, "DIA_Baltram_LetUsTrade_15_00"); //¿No podríamos hacer negocios juntos, después de todo?
	AI_Output (self, other, "DIA_Baltram_LetUsTrade_01_01"); //Escucha, si me traes 10 jamones y 10 botellas de vino, volveré a tratar contigo.
	AI_Output (other, self, "DIA_Baltram_LetUsTrade_15_02"); //Veré lo que puedo hacer.
	
	MIS_BaltramTrade = LOG_RUNNING;
};

var int BaltramEnoughBacon;
var int BaltramEnoughWine;

///////////////////////////////////////////////////////////////////////
//	Info HaveYourWarez
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_HaveYourWarez		(C_INFO)
{
	npc			 = 	VLK_410_Baltram;
	nr			 =  6;
	condition	 = 	DIA_Baltram_HaveYourWarez_Condition;
	information	 = 	DIA_Baltram_HaveYourWarez_Info;
	permanent	 =  TRUE;
	description	 = 	"Tengo tu mercancía.";
};
func int DIA_Baltram_HaveYourWarez_Condition ()
{
	if (MIS_BaltramTrade == LOG_RUNNING)
	&& (MIS_BaltramTrade != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Baltram_HaveYourWarez_Info ()
{
	AI_Output (other, self, "DIA_Baltram_HaveYourWarez_15_00"); //Tengo tu mercancía.
	AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_01"); //Enséñamela.
	
	if (Npc_HasItems (other,ItFo_Bacon) < 10)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_02"); //Habíamos acordado 10 jamones. Vuelve cuando tengas suficientes.
		
		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};  
	if (Npc_HasItems (other,ItFo_Wine) < 10)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_03"); //¿Y qué hay de las 10 botellas de vino? ¿Se te han olvidado?
	
		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};
	
	if (BaltramEnoughBacon == TRUE
	&&  BaltramEnoughWine  == TRUE)
	{
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_04"); //Mmm, no es del mejor pero, en estos tiempos, no se puede ser demasiado exigente.
		
		B_GiveInvItems (other,self,ItFo_Bacon,10);
		B_GiveInvItems (other,self,ItFo_Wine,10);
		
		MIS_BaltramTrade = LOG_SUCCESS;
	
		B_GivePlayerXP (XP_BaltramTrade);
		
		AI_Output (self, other, "DIA_Baltram_HaveYourWarez_01_05"); //Ahora no hay nada que nos impida hacer negocios juntos.
	};	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Baltram_PICKPOCKET (C_INFO)
{
	npc			= VLK_410_Baltram;
	nr			= 900;
	condition	= DIA_Baltram_PICKPOCKET_Condition;
	information	= DIA_Baltram_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Baltram_PICKPOCKET_Condition()
{
	C_Beklauen (76, 175);
};
 
FUNC VOID DIA_Baltram_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Baltram_PICKPOCKET);
	Info_AddChoice		(DIA_Baltram_PICKPOCKET, DIALOG_BACK 		,DIA_Baltram_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Baltram_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Baltram_PICKPOCKET_DoIt);
};

func void DIA_Baltram_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Baltram_PICKPOCKET);
};
	
func void DIA_Baltram_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Baltram_PICKPOCKET);
};



















