// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Skip_EXIT(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 999;
	condition	= DIA_Addon_Skip_EXIT_Condition;
	information	= DIA_Addon_Skip_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Skip_PICKPOCKET (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 900;
	condition	= DIA_Addon_Skip_PICKPOCKET_Condition;
	information	= DIA_Addon_Skip_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Skip_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};
 
FUNC VOID DIA_Addon_Skip_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
	
func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Skip_Hello(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Hello_Condition;
	information	= DIA_Addon_Skip_Hello_Info;

	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& PlayerTalkedToSkipNW == TRUE
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_00"); //Mira quién se vuelve a cruzar con el viejo Skip.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_01"); //(exagerado) ¡Te conozco!
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_02"); //El muelle junto a la ciudad, ¿recuerdas?
	AI_Output (other,self ,"DIA_Addon_Skip_Hello_15_03"); //¡Skip!, ¿no?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_04"); //(orgulloso) Veo que te dejé huella.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_05"); //Desde entonces no he dejado de ver tu CARA en todas partes.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_06"); //¡Pues claro!
	B_UseFakeScroll ();
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_07"); //En fin, no es que se parezca mucho, pero eres TÚ.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_08"); //No dejes que te afecte. Mi propio cartel es igual de ridículo.
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  			 Baltrams Paket
// ************************************************************
instance DIA_Addon_SkipADW_BaltramPaket		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 2;
	condition	= DIA_Addon_SkipADW_BaltramPaket_Condition;
	information	= DIA_Addon_SkipADW_BaltramPaket_Info;

	description	= "Tengo un paquete para ti de Baltram.";
};
func int DIA_Addon_SkipADW_BaltramPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_SkipADW_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_SkipADW_BaltramPaket_15_00"); //Tengo un paquete para ti de Baltram.
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_01"); //(sonriendo) A ese tipo le debió gustar mucho nuestro ron si nos envía su mercancía hasta AQUÍ.
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_02"); //Toma, dale estas dos botellas de ron. Me he bebido la tercera mientras esperaba.
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

// ************************************************************
// 			  			Was machst du hier?
// ************************************************************
INSTANCE DIA_Addon_Skip_Job(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 3;
	condition	= DIA_Addon_Skip_Job_Condition;
	information	= DIA_Addon_Skip_Job_Info;

	description = "¿Qué estás haciendo aquí?";
};                       
FUNC INT DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_Job_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Job_15_00"); //¿Qué estás haciendo aquí?
	AI_Output (self ,other, "DIA_Addon_Skip_Job_08_01"); //Acabo de volver de Khorinis y estoy esperando a que Greg vuelva.
};

// ************************************************************
// 			  			Greg getroffen!
// ************************************************************
instance DIA_Addon_Skip_ADW_GregGetroffen		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 4;
	condition	= DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information	= DIA_Addon_Skip_ADW_GregGetroffen_Info;

	description	= "He visto a Greg en Khorinis.";
};
func int DIA_Addon_Skip_ADW_GregGetroffen_Condition ()
{
	if (PlayerTalkedToGregNW  == TRUE)
	&& (GregIsBack == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ADW_GregGetroffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ADW_GregGetroffen_15_00"); //He visto a Greg en Khorinis.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_01"); //¿En serio? ¡Maldición! Algo debe de haber ido mal.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_02"); //Debería haber vuelto con nuestra embarcación hace tiempo.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_03"); //(pensativo) Supongo que debería volver a Khorinis y esperarlo all
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_04"); //(suspira) Pero hoy seguro que no, acabo de llegar.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  			Überfahrt - PERM
// ************************************************************
var int Skip_Transport_Variation;
// ------------------------------------------------------------
instance DIA_Addon_Skip_Transport(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 99;
	condition	= DIA_Addon_Skip_Transport_Condition;
	information	= DIA_Addon_Skip_Transport_Info;
	permanent	= TRUE;
	description = "¿Puedes llevarme a Khorinis?";
};                       
FUNC INT DIA_Addon_Skip_Transport_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Job))
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Skip_Transport_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Transport_15_00"); //¿Puedes llevarme a Khorinis?
	if (GregIsBack == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_01"); //Ni hablar. Ahora no voy a moverme. Antes quiero una buena dosis de ponche.
	}
	else if (Skip_Transport_Variation == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_02"); //¿Estás chalado? ¡Hemos perdido nuestro BARCO, amigo!
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_03"); //¡No pienso echar a la mar nuestra última barca porque a ti no te dé la gana ir a Khorinis SOLO!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_04"); //Por última vez: ¡NO!
	};
};

// ************************************************************
// 			 			Banditen + Rüstung
// ************************************************************
// ------------------------------------------------------------
// 							About Bandits
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Bandits(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Bandits_Condition;
	information	= DIA_Addon_Skip_Bandits_Info;

	description = "¿Qué me puedes contar de esos bandidos?";
};                       
FUNC INT DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Skip_Bandits_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Bandits_15_00"); //¿Qué me puedes contar de esos bandidos?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_01"); //¡¿Los bandidos?! ¡Nos están ATACANDO!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_02"); //¿Por qué te crees que estamos levantando la empalizada?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_03"); //Nosotros mismos hemos traído a esos cabrones.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_04"); //Antes comerciábamos con ellos.¡Pero te diré que tienen más oro del que nunca podrán gastar!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_05"); //Estaban dispuestos a pagar lo que fuera por una botella de ron.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_06"); //Pero esos tiempos pasaron. ¡Ahora es la guerra!
	AI_Output (other, self, "DIA_Addon_Erol_Bandits_15_06"); //¿Qué ha pasado?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_07"); //Esos bastardos no pagaron el último envío.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_08"); //Así que fui a comprobar qué había pasado con nuestro oro.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_09"); //¡Pero cuando llegué al pantano, esos granujas me atacaron!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_10"); //Y eso no es todo. ¡mataron a Angus y a Hank! Dos de nuestros mejores hombres.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_11"); //No te acerques a ese pantano, te lo advierto.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_12"); //Irán a por cualquiera que no parezca un andrajoso, como ellos.
	
	
};

// ------------------------------------------------------------
// 						Banditenrüstung
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_ArmorPrice(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_ArmorPrice_Condition;
	information	= DIA_Addon_Skip_ArmorPrice_Info;

	description = "¡Necesito armadura de bandido!";
};                       
FUNC INT DIA_Addon_Skip_ArmorPrice_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};
func VOID DIA_Addon_Skip_ArmorPrice_Info()
{	
	AI_Output (other,self , "DIA_Addon_Skip_ArmorPrice_15_00"); //Necesito una armadura de bandido.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_01"); //¿Quieres entrar allí? ¿Estás loco? 
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_02"); //¡Si uno de esos tipos averigua que no eres de los suyos, te harán picadillo!
	AI_Output (other, self, "DIA_Addon_Skip_ArmorPrice_15_02"); //¿Sabes dónde puedo encontrar una armadura de esas?
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_03"); //(suspira) No te rindes fácilmente, ¿verdad? Muy bien. Antes teníamos un traje.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_04"); //Probablemente Greg lo siga teniendo en su cabaña.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_05"); //Quizá puedas comprárselo cuando vuelva
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Skip cree que la armadura está en la cabaña de Greg."); 
};

// ------------------------------------------------------------
// 						In Gregs Hütte
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GregsHut(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_GregsHut_Condition;
	information	= DIA_Addon_Skip_GregsHut_Info;
	permanent	= FALSE;
	description = "¿Puedes decirme cómo entrar a la cabaña de Greg?";
};                       
FUNC INT DIA_Addon_Skip_GregsHut_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_ArmorPrice))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_GregsHut_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_GregsHut_15_00"); //Dime cómo puedo entrar a su cabaña.
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_01"); //¡Para el carro! ¡No tan deprisa!
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_02"); //No estarás pensando en saquear a Greg, ¿verdad?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_03"); //Cuando se fue, le dejó las llaves a Francis y le dijo que no dejara entrar a NADIE en su cabaña.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Francis tiene la llave de la cabaña de Greg. Tiene órdenes de no dejar pasar a nadie."); 
	
	Knows_GregsHut = TRUE;
};

// ------------------------------------------------------------
//					Über Francis --> Samuel
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Francis (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Francis_Condition;
	information	= DIA_Addon_Skip_Francis_Info;
	permanent	= FALSE;
	description = "¿Qué puedes contarme sobre Francis?";
};   
FUNC INT DIA_Addon_Skip_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Francis_15_00"); //¿Qué puedes contarme sobre Francis?
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_01"); //Francis es nuestro tesorero.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_02"); //El Capitán confía en él. Por eso lo dejó al cargo.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_03"); //Pero ninguno de nuestros hombres lo toma en serio.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_04"); //Si quieres saber más, habla con Samuel.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_05"); //Tiene su destilería en una pequeña cueva al norte de aquí.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_06"); //No hay ni una sola alma en este campamento sobre la que Samuel no SEPA todo
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Debería hablar con Samuel. Quizá él pueda ayudarme."); 
};
	
	
// ************************************************************
// 						Die Turmbanditen
// ************************************************************
// ------------------------------------------------------------
// 			 				Raven
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Raven(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_Raven_Condition;
	information	= DIA_Addon_Skip_Raven_Info;
	permanent	= FALSE;
	description = "¿Has conocido a Raven?";
};                       
FUNC INT DIA_Addon_Skip_Raven_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};			
};
FUNC VOID DIA_Addon_Skip_Raven_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Raven_15_00"); //¿Has conocido a Raven?
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_01"); //Pues claro. Cuando estaba con Henry, en la puerta, vi a Raven apostar a algunos de sus hombres en una torre al sur.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_02"); //A un tiro de piedra de nuestro campamento. (ríe) Supongo oque pretenderán espiarnos.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_03"); //También he visto cómo trata a los suyos cuando no cumplen con su deber.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_04"); //Hace picadillo a quien no obedece sus órdenes al pie de la letra.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_05"); //Hazme caso: no te acerques a Raven.
};



// ************************************************************
// ***														***
// 						Die Angus und Hank Show
// ***														***
// ************************************************************

// ------------------------------------------------------------
// 			 			Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHank(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHank_Condition;
	information	= DIA_Addon_Skip_AngusHank_Info;

	description = "Háblame más sobre Angus y Hank.";
};                       
FUNC INT DIA_Addon_Skip_AngusHank_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_AngusnHank_15_00"); //Háblame más sobre Angus y Hank.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_01"); //Angus y Hank tenían que reunirse con unos bandidos a la entrada del campamento.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_02"); //Llevaban todo tipo de suministros. Todo lo que esos granujas nos habían encargado.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_03"); //Acero forjado, ganzúas y demás. 
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_04"); //Pero nunca volvieron. ¡Esos desalmados debieron deshacerse de ellos!
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_05"); //Morgan y Bill fueron a buscarlos, pero no los encontraron.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_06"); //Bill estaba destrozado. Eran amigos suyos.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_07"); //Es muy joven, esas cosas aún le afectan.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_08"); //El resto nos lo tomamos con calma. La mercancía no nos importa mucho. (suspira) Pero el ponche que llevaban
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_09"); //(enfadado) ¡Hablamos de al menos 20 botellas!
	MIS_ADDON_SkipsGrog = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_SkipsGrog,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip dice que los bandidos le han robado 20 botellas de ponche y quiere recuperarlas.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Angus y Hank tenían que reunirse con un par de bandidos. Nunca se les volvió a ver.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"La búsqueda de Morgan y Bill sigue sin dar frutos.");
};

// ------------------------------------------------------------
// 			 		Angus und Hank sind TOT
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankDead(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankDead_Condition;
	information	= DIA_Addon_Skip_AngusHankDead_Info;
	permanent	= FALSE;
	description = "Sobre Angus y Hank…";
};                       
FUNC INT DIA_Addon_Skip_AngusHankDead_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	&& (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankDead_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_00"); //Sobre Angus y Hank
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_01"); //¿Qué?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_01"); //Los he encontrado.
	//AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_02"); //Sie sind tot, richtig?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_03"); //Están muertos.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_03"); //(para sí) Muertos y bien muertos. ¡Pobres diablos!
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_04"); //En fin, era de esperar.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_05"); //Deberías decírselo a Bill, si es que aún no lo sabe.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_06"); //Pero no seas brusco, aún es joven.
};

// ------------------------------------------------------------
// 			 			Kenne den Mörder
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankMurder(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankMurder_Condition;
	information	= DIA_Addon_Skip_AngusHankMurder_Info;
	permanent	= FALSE;
	description = "Yo sé quién mató a Angus y a Hank.";
};                       
FUNC INT DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_AngusHankDead))
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankMurder_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_JuanMurder_15_00"); //Sé quién asesinó a Angus y Hank.
	if (MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_01"); //Me alegro, pero ya están muertos. ¿Qué más da?
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_02"); //La venganza no ha hecho rico a ningún pirata.
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_03"); //Mientras recupere mi ponche
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_04"); //No me importa quién los haya matado. ¿Y el ponche?
	};
};

// ------------------------------------------------------------
// 							Grog zurück
// ------------------------------------------------------------
instance DIA_Addon_Skip_Grog		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 9;
	condition	= DIA_Addon_Skip_Grog_Condition;
	information	= DIA_Addon_Skip_Grog_Info;
	permanent	= TRUE;
	description	= "Sobre el ponche…";
};
func int DIA_Addon_Skip_Grog_Condition ()
{
	if (MIS_ADDON_SkipsGrog == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_Grog_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_00"); //Sobre el ponche
		
	if (Npc_HasItems (other,Itfo_Addon_Grog)>= 20)
	{
		Info_ClearChoices	(DIA_Addon_Skip_Grog);
		Info_AddChoice	(DIA_Addon_Skip_Grog, DIALOG_BACK, DIA_Addon_Skip_Grog_back );
		Info_AddChoice	(DIA_Addon_Skip_Grog, "Aquí están tus 20 botellas.", DIA_Addon_Skip_Grog_geben );
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_01"); //Te faltan 20 botellas, ¿verdad?
		AI_Output	(self, other, "DIA_Addon_Skip_Grog_08_02"); //Sí, maldita sea. Todo lo que tenía.
	};
};
func void DIA_Addon_Skip_Grog_back ()
{
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_00"); //Toma, tus 20 botellas.
	B_GiveInvItems (other, self, Itfo_Addon_Grog, 20);
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip ha recuperado las 20 botellas de ponche y está contento.");
	
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_SkipsGrog);

	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_01"); //¿Qué? ¿En serio? ¿Así de fácil?
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_02"); //Bueeenoooo
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_03"); //Vale, te las pagaré.
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_04"); //¿No tienes nada más interesante que el oro?
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_05"); //Mmh. Veamos. Tengo este anillo.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_06"); //Lo gané apostando en un pub de un apestoso muelle hace años.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_07"); //El tipo me dijo por aquel entonces que era mágico, pero no sé si es verdad.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_08"); //¿Prefieres esto en vez de dinero?
	
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Dame el dinero.", DIA_Addon_Skip_Grog_gold );
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Dame el anillo.", DIA_Addon_Skip_Grog_ring );
};
func void DIA_Addon_Skip_Grog_ring ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_ring_15_00"); //Dame el anillo.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_ring_08_01"); //Aquí tienes.
	B_GiveInvItems (self, other, ItRi_Prot_Edge_02, 1);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_gold ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_gold_15_00"); //Dame el dinero.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_gold_08_01"); //Muy bien.
	var int GrogKohle;
	GrogKohle = (Value_Grog * 20);
	B_GiveInvItems (self, other, ItMi_Gold, GrogKohle);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};



// ************************************************************
// 			  				TRADE 
// ************************************************************
INSTANCE DIA_Addon_Skip_News(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 888;
	condition	= DIA_Addon_Skip_News_Condition;
	information	= DIA_Addon_Skip_News_Info;
	permanent	= FALSE;
	description = "¿Tienes algo que vender?";
};                       
FUNC INT DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_News_15_00"); //¿Tienes algo que vender?
	AI_Output (self ,other,"DIA_Addon_Skip_News_08_01"); //Si quieres hacer negocios, habla con Garett. Se encarga de nuestros suministros.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Anheuern(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 11;
	condition	= DIA_Addon_Skip_Anheuern_Condition;
	information	= DIA_Addon_Skip_Anheuern_Info;
	permanent	= FALSE;
	description = "Tienes que ayudarme.";
};                       
FUNC INT DIA_Addon_Skip_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Anheuern_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_00"); //Tienes que ayudarme.
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_01"); //¿Con qué?
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_01"); //El cañón espera.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_02"); //Veo que te llevas a algunos hombres. ¡Bien pensado! 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_03"); //¡Más vale que te lleves a algunos de los hombres!
	};
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_04"); //¡Ese cañón es peligrosísimo!
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Skip_ComeOn(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr		 	= 12;
	condition	= DIA_Addon_Skip_ComeOn_Condition;
	information	= DIA_Addon_Skip_ComeOn_Info;
	permanent	= TRUE;
	description	= "Ven conmigo.";
};
func int DIA_Addon_Skip_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ComeOn_15_00"); //Ven conmigo.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_02"); //Espera. Antes, volvamos al cañón
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_01"); //¡Venga!
		if (C_BodyStateContains (self, BS_SIT))
		{
			AI_StandUp (self);
			B_TurnToNpc (self,other);
		};
		AI_StopProcessInfos (self);
		
		B_Addon_PiratesFollowAgain();
		
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GoHome(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 13;
	condition	= DIA_Addon_Skip_GoHome_Condition;
	information	= DIA_Addon_Skip_GoHome_Info;
	permanent	= TRUE;
	description = "Ya no te necesito.";
};                       
FUNC INT DIA_Addon_Skip_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Skip_GoHome_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_GoHome_15_00"); //Ya no te necesito.
	AI_Output (self, other, "DIA_Addon_Skip_GoHome_08_01"); //Bien, pues ya está. Me encontrarás en el campamento.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_TooFar(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 14;
	condition	= DIA_Addon_Skip_TooFar_Condition;
	information	= DIA_Addon_Skip_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_TooFar_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_01"); //¡Ya nos hemos alejado mucho!
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_02"); //¡Si insistes en avanzar más, no cuentes con nosotros!
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_03"); //¡Si insistes en avanzar más, no cuentes conmigo!
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Oase = Treffpunkt
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Treffpunkt (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Treffpunkt_Condition;
	information	= DIA_Addon_Skip_Treffpunkt_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Treffpunkt_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_TELEPORT_PATH_06") <= 800)
	&& (C_AllCanyonRazorDead() == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Treffpunkt_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_00"); //Si nos perdemos, nos encontraremos en el abrevadero.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_02"); //¡En marcha!
		
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 				Orks!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Orks (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Orks_Condition;
	information	= DIA_Addon_Skip_Orks_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Orks_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Orks_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_01"); //¡Orcos! ¡Odio a esos bichos!

	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Alle Razor tot
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AllRazorsDead (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_AllRazorsDead_Condition;
	information	= DIA_Addon_Skip_AllRazorsDead_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_AllCanyonRazorDead() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_AllRazorsDead_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_03"); //Parece que tenemos a todas las cuchillas.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_04"); //Podemos dar un par de vueltas más, si te apetece.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_05"); //Mientras no salgamos del cañón 
	
	AI_StopProcessInfos (self); 
};


