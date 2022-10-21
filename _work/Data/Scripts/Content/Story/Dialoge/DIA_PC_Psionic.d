// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lester_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_EXIT_Condition;
	information	= DIA_Lester_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Lester_Hello (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Hello_Condition;
	information	= DIA_Lester_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       
FUNC INT DIA_Lester_Hello_Condition()
{	
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Hello_Info()
{	
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self ,other,"DIA_Lester_Hello_13_00");	//�Eres T�? �De verdad! Chico, �me alegro mucho de verte!

	Info_ClearChoices	(DIA_Lester_Hello);

	Info_AddChoice		(DIA_Lester_Hello, "�Te conozco?" 					,DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice		(DIA_Lester_Hello, "�Lester! �C�mo has llegado aqu�?"		,DIA_Lester_Hello_Lester);
};
FUNC VOID DIA_Lester_Hello_Lester()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_Lester_15_00");	//�Lester! �C�mo has llegado aqu�?
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_01");	//Fue una hu�da desquiciada. Despu�s de que la barrera explotara, estuve merodeando por la zona, completamente desorientado.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_02");	//Me tir� varios d�as abri�ndome camino por estos bosques hasta que, por fin, encontr� este valle.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_03");	//Diego, Milten y Gorn siguen en el Valle de las Minas. Al menos, eso creo.
};
FUNC VOID DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_YouKnowMe_15_00");	//�Se supone que nos conocemos?
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//�Hola? �Hay alguien en casa? Arriesgu� el cuello para que pudieras coger aquella piedra extra�a.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//Est�s en deuda conmigo... Esta vez deber�as RECORDARLO.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_03"); 	//�Recuerdas todav�a a Diego, Milten y Gorn?

	Info_AddChoice		(DIA_Lester_Hello, "�Diego, Milten y QUI�N?" 	,DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice		(DIA_Lester_Hello, "Claro. �Qu� pasa con ellos?"	,DIA_Lester_Hello_KnowFourFriends);

};
FUNC VOID DIA_Lester_Hello_KnowFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Claro. �Qu� pasa con ellos?
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Por lo que yo s�, deber�an haber sobrevivido a la destrucci�n de la barrera.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//No tengo ni idea de d�nde est�n ahora. Probablemente esos tres a�n ronden el Valle de las Minas.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Si te encuentras con ellos, h�zmelo saber.
};
FUNC VOID DIA_Lester_Hello_WhoFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_WhoFourFriends_15_00");	//�Diego, Milten y QUI�N?
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//No me digas que no recuerdas nada de eso. Los focos de piedra, el troll, la enorme pila de mineral de los magos de agua...
	AI_Output	(other, self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//No estoy seguro...
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//Ya te acordar�s. A m� tambi�n me llev� un tiempo poner en orden mis pensamientos.
};
// ************************************************************
// 		  				  Was ist passiert?		//E1
// ************************************************************
INSTANCE DIA_Lester_WhatHappened (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_WhatHappened_Condition;
	information	= DIA_Lester_WhatHappened_Info;
	permanent	= FALSE;
	description = "�Qu� ha pasado?";
};                       
FUNC INT DIA_Lester_WhatHappened_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
		&& (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_WhatHappened_Info()
{	
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_00");	//�Qu� ha pasado?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_01");	//Tras la derrota del Durmiente, toda la hermandad perdi� la cabeza.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_02");	//Sin su amo, no son m�s que cascarones vac�os.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_03");	//�Y t�? �Qu� hay de ti?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_04");	//A m� me pas� lo mismo. Tuve pesadillas y alucinaciones, pero cuando recuper� m�s o menos la cordura, sal� huyendo.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_05");	//En una ocasi�n me pareci� ver que una enorme sombra negra se lanzaba contra un grupo de fugitivos y los abrasaba con una llamarada gigante.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_06");	//En ese momento, cre� que un drag�n hab�a venido a matarme.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_07");	//�Viste algo m�s?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_08");	//No, �me di la vuelta y sal� corriendo!
};
// ************************************************************
// 		  				   Minental		 		//E1 
// ************************************************************
INSTANCE DIA_Lester_MineColony (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_MineColony_Condition;
	information	= DIA_Lester_MineColony_Info;
	permanent	= FALSE;
	description = "�Cu�nto tiempo llevas escondi�ndote en este valle?";
};                       
FUNC INT DIA_Lester_MineColony_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Lester_Hello))
		&& (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_MineColony_Info()
{	
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_00");	//�Cu�nto tiempo llevas escondi�ndote en este valle?
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_01");	//No lo s� con exactitud. Una semana, quiz�. Pero hay una cosa m�s:
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_02");	//Cuando vine aqu�, ya al anochecer, ech� un vistazo a la monta�a. Solo se pod�an ver unos pocos �rboles.
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_03");	//Y cuando mir� a la ma�ana siguiente, all� estaba la torre. Habr�a jurado que no estaba antes. Desde entonces, no he salido del valle.
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_04");	//�Te refieres a la torre de Xardas? Sab�a que era poderoso, pero crear una torre de esa manera...
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_05");	//�Xardas el nigromante? �Vive en esa torre? No se si me gusta la idea...
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_06");	//No te preocupes, es uno de los que me rescat� del templo del Durmiente. Est� de nuestro lado.
};
///////////////////////////////////////////////////////////////////////
//	Info SEND_XARDAS
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_SEND_XARDAS		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_SEND_XARDAS_Condition;
	information	 = 	DIA_Lester_SEND_XARDAS_Info;
	permanent	 = 	FALSE;
	description	 = 	"Tienes que hablarle a Xardas de la sombra...";
};
func int DIA_Lester_SEND_XARDAS_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Lester_WhatHappened)
	&& Npc_KnowsInfo (other,DIA_Lester_MineColony)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lester_SEND_XARDAS_Info ()
{
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_00"); //Tienes que hablarle a Xardas de la sombra, podr�a ser importante.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_01"); //�No crees que fuera mi imaginaci�n? Parece que creas que era realmente un...
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_02"); //... un drag�n. S�.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_03"); //Vuelves a estar metido en el ajo, �verdad?
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_04"); //Yo no dir�a que en el ajo... a�n no.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_05"); //(Suspira) Bueno, si es tan importante, entonces ir� a verle, pero no ahora.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_06"); //Por el momento, voy a descansar. Todav�a estoy exhausto despu�s de escapar de la colonia penal.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_07"); //Creo que tienes grandes planes. Te veo luego en casa de Xardas.
	
	AI_StopProcessInfos (self);
	
	//wird bei LOLO zu Xardas gebeamt
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_STADT		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lester_STADT_Condition;
	information	 = 	DIA_Addon_Lester_STADT_Info;

	description	 = 	"�Me dirijo a KHORINIS! �Qu� sabes acerca de la ciudad?";
};

func int DIA_Addon_Lester_STADT_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lester_STADT_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_00"); //�Voy camino de Khorinis! �Qu� sabes sobre la ciudad?
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_01"); //�Khorinis? Pues que es un puerto mar�timo, nada especial.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_02"); //�Por qu� lo preguntas?
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_03"); //Tengo que ir a ver a los paladines que dicen que est�n en la ciudad.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_04"); //(r�e) �En serio? Ja. No te permitir�n entrar, y mucho menos a donde est�n los paladines.
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_Vorschlag		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lester_Vorschlag_Condition;
	information	 = 	DIA_Addon_Lester_Vorschlag_Info;

	description	 = 	"�Alguna sugerencia para entrar en la ciudad?";
};

func int DIA_Addon_Lester_Vorschlag_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lester_STADT))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_Vorschlag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_00"); //�Alguna sugerencia para entrar en la ciudad?
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_01"); //Pues claro. Hace tiempo trabaj� para un viejo alquimista llamado Constantino.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_02"); //Tiene mucha influencia en la ciudad y los guardias de la puerta tienen �rdenes suyas de dejar pasar a quien vaya a venderle hierbas raras.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_03"); //As� que es muy f�cil. Coges un buen pu�ado de plantas de toda la zona, finges que trabajas para Constantino, y adentro.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_04"); //Pero no hace falta que vayas escogiendo las plantas. Los guardias no son muy listos y no saben nada de alquimia.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_05"); //El manojo de hierbas tiene que parecerles bien para dejarte entrar.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_06"); //Creo que con 10 espec�menes del mismo tipo de planta bastar�.
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_07"); //Gracias por el consejo.
	
	Log_CreateTopic (TOPIC_Addon_PickForConstantino, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_PickForConstantino,"Lester dice que los guardias de la ciudad me dejar�n pasar si llevo 10 plantas del mismo tipo si les digo que son para el alquimista Constantino."); 
	
	MIS_Addon_Lester_PickForConstantino = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info PASSAGEPLANTSSUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_PASSAGEPLANTSSUCCESS		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition;
	information	 = 	DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info;

	description	 = 	"Lo de las plantas para Constantino fue mano de santo.";
};

func int DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition ()
{
	if (MIS_Addon_Lester_PickForConstantino == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00"); //Lo de las plantas para Constantino funcion� a las mil maravillas. Los guardias me dejaron entrar.
	AI_Output	(self, other, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01"); //Ya te lo dije. Deber�as hacerme caso m�s a menudo, amigo.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 		  		Perm	
// ************************************************************
INSTANCE DIA_Lester_Perm (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 99;
	condition	= DIA_Lester_Perm_Condition;
	information	= DIA_Lester_Perm_Info;
	permanent	= TRUE;
	description = "�Qu� sabes de esta zona?";
};                       
FUNC INT DIA_Lester_Perm_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
	&& (Kapitel < 3)
	&& (Npc_GetDistToWP (self, "NW_XARDAS_TOWER_LESTER") <= 2000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Perm_Info()
{	
	AI_Output	(other, self,"DIA_Lester_Perm_15_00");	//�Qu� sabes de esta zona?
	AI_Output	(self, other,"DIA_Lester_Perm_13_01");	//Si sigues por ese camino, llegar�s a una granja. La ciudad comienza poco m�s all�.
	AI_Output	(self, other,"DIA_Lester_Perm_13_02");	//Pero ten cuidado, por aqu� no solo hay ratas y lobos. �Tambi�n hay trasgos y bandidos!
};
// ************************************************************
// 		  		Sleep
// ************************************************************
INSTANCE DIA_Lester_Sleep (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 99;
	condition	= DIA_Lester_Sleep_Condition;
	information	= DIA_Lester_Sleep_Info;
	permanent	= TRUE;
	description = "�Todav�a est�s agotado?";
};                       
FUNC INT DIA_Lester_Sleep_Condition()
{
	if  (Kapitel < 3)
	&& (Npc_GetDistToWP (self, "NW_XARDAS_TOWER_IN1_31") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Sleep_Info()
{	
	AI_Output	(other, self,"DIA_Lester_Sleep_15_00");	//�Todav�a est�s agotado?
	AI_Output	(self, other,"DIA_Lester_Sleep_13_01");	//No sabes cu�nto. (Bosteza) Se lo he contado todo a Xardas. Ahora voy a dormir durante un tiempo. Como un d�a o...
	AI_Output	(self, other,"DIA_Lester_Sleep_13_02");	//� dos... o m�s.
	
	AI_StopProcessInfos (self);
};
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Lester_KAP3_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP3_EXIT_Condition;
	information	= DIA_Lester_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BACKINTOWN
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_BACKINTOWN		(C_INFO) 
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_BACKINTOWN_Condition;
	information	 = 	DIA_Lester_BACKINTOWN_Info;
	important	 = 	TRUE;
};
func int DIA_Lester_BACKINTOWN_Condition ()
{	
	if (Npc_GetDistToWP (self, "LEVELCHANGE") <= 500) 
		&& (Kapitel == 3)
	{
		return TRUE;
	};
};
func void DIA_Lester_BACKINTOWN_Info ()
{
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_00"); //Eh, �por fin has vuelto! Tienes que ir a ver a Xardas de inmediato, hay un problema.
	AI_Output			(other, self, "DIA_Lester_BACKINTOWN_15_01"); //Me lo creo.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_02"); //Desde que te fuiste se ha armado la gorda
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_03"); //Habla con Xardas, �te est� esperando!
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_04"); //Xardas me dio est� runa para ti. Te ayudar� a llegar hasta �l m�s r�pido. Nos volveremos a encontrar all�.
	
	CreateInvItems 		(self,ItRu_TeleportXardas,1);
	B_GiveInvItems 		(self,other,ItRu_TeleportXardas,1);
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");	//Joly: Lester geht wieder zur�ck in sein Tal!
};

///////////////////////////////////////////////////////////////////////
//	Info perm3
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_PERM3		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	900;
	condition	 = 	DIA_Lester_PERM3_Condition;
	information	 = 	DIA_Lester_PERM3_Info;
	permanent	 = 	TRUE;

	description	 = 	"No pareces muy entusiasmado.";
};

func int DIA_Lester_PERM3_Condition ()
{
	if (Kapitel >= 3)
	&& (Lester_IsOnBoard != LOG_SUCCESS)
	{
		return TRUE;
	};
};

var int DIA_Lester_PERM3_OneTime;
func void DIA_Lester_PERM3_Info ()
{
	AI_Output			(other, self, "DIA_Lester_PERM3_15_00"); //No pareces muy entusiasmado.
	
	if (hero.guild == GIL_KDF)
	{
		if (DIA_Lester_PERM3_OneTime == FALSE)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_01"); //Chico, es que no estoy muy entusiasmado. Estoy hecho polvo y me duele constantemente la cabeza.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_02"); //Cada vez que aparece uno de esos encapuchados de negro, la jaqueca empeora.
			
			if (SC_KnowsMadPsi == TRUE)
				{
					AI_Output			(other, self, "DIA_Lester_PERM3_15_03"); //Y puedo decirte exactamente por qu�.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_04"); //�S�? Me parece que no quiero saberlo.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_05"); //Esos encapuchados de negro, o buscadores, como les llamamos los magos, eran los disc�pulos de un poderoso archidemonio. �Te suena de algo?
					AI_Output			(self, other, "DIA_Lester_PERM3_13_06"); //Mmm. No. A menos que quieras decir que...
					AI_Output			(other, self, "DIA_Lester_PERM3_15_07"); //S�, exactamente. Los buscadores eran seguidores del Durmiente. La secta de renegados locos del campamento del pantano.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_08"); //Son tu gente, Lester. La antigua hermandad del Durmiente. Ahora no son m�s que desalmados servidores del mal.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_09"); //Ten�a cierta idea de eso, pero esperaba que no fuera cierto. �Quieres decir que ha vuelto? �El Durmiente ha vuelto?
					AI_Output			(other, self, "DIA_Lester_PERM3_15_10"); //Buena pregunta. Solo s� que tengo que detener a los buscadores antes de que se hagan demasiado poderosos.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_11"); //No me gusta, pero supongo que tienes raz�n. Lo siento, pero todo esto se me est� subiendo a la cabeza..
					B_LogEntry (TOPIC_DEMENTOREN,"Mis sospechas se han confirmado. A Lester no le cabe duda que los buscadores son los seguidores del Durmiente que vienen del viejo campamento del pantano."); 
					B_GivePlayerXP (XP_Lester_KnowsMadPsi);
					DIA_Lester_PERM3_OneTime = TRUE;
				};
		};
	}
	else
	{
		if (Lester_IsOnBOard == LOG_SUCCESS)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_12"); //Los dolores de cabeza siguen ah�, aunque espero que el problema se solucione pronto.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_13"); //De una manera o de otra.
		}
		else if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_14"); //Los dolores de cabeza se est�n volviendo insoportables. Y ahora esos hombres lagarto me atacan constantemente. Me pregunto de d�nde vienen.
		}
		else
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_15"); //Estos dolores no cesan. Se est� cociendo algo.
		};
	};
	AI_Output			(self, other, "DIA_Lester_PERM3_13_16"); //(Suspira) Creo que antes tengo que descansar.
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Lester_KAP4_EXIT(C_INFO)
{
	npc		= PC_Psionic;
	nr		= 999;
	condition	= DIA_Lester_KAP4_EXIT_Condition;
	information	= DIA_Lester_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Lester_KAP5_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP5_EXIT_Condition;
	information	= DIA_Lester_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info XardasWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_XARDASWEG		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_XARDASWEG_Condition;
	information	 = 	DIA_Lester_XARDASWEG_Info;

	description	 = 	"�D�nde est� Xardas?";
};

func int DIA_Lester_XARDASWEG_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Lester_XARDASWEG_Info ()
{
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_00"); //�D�nde est� Xardas?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_01"); //Se ha ido y ha dejado esos seres demon�acos en su torre.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_02"); //Creo que no quiere que nadie husmee en su torre mientras no est�.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_03"); //�Ad�nde ha ido?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_04"); //No lo dijo. Solo me pidi� que te diera esta carta.
	
	CreateInvItems 		(self, ItWr_XardasLetterToOpenBook_MIS, 1);					
	B_GiveInvItems 		(self, other, ItWr_XardasLetterToOpenBook_MIS,1);
	
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_05"); //La he le�do. Lo siento. Soy demasiado curioso.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_06"); //�Y?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_07"); //Ni idea, chico, no entend� ni una palabra. Pero hay una cosa clara: tardaremos bastante en volver a verle.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_08"); //Creo que las cosas se han complicado demasiado para su gusto y se ha ido a las colinas.
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Xardas ha desaparecido. Lester me dio una carta que Xardas dej� para m�."); 
};


///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lester_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"He encontrado d�nde se esconde el enemigo.";
};
func int DIA_Lester_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lester_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lester_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_00"); //He averiguado d�nde se esconde el enemigo.
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_01"); //No me preguntes por qu�, pero tengo la sensaci�n de que deber�a ir contigo.
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_02"); //�Qu� quieres decir con eso?
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_03"); //No puedo explicarlo, pero s� que solo encontrar� la respuesta si voy contigo.
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lester_KnowWhereEnemy_15_04"); //Lo siento, pero el barco ya va completo.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_05"); //Puede que s�, puede que mi destino sea insignificante en comparaci�n con lo que nos espera.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_06"); //Sabes lo que debes hacer: alzarte contra el mal. No te preocupes por m�.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_07"); //No soy importante.
	}
	else 
	{
		Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"No te puedo llevar.",DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"�Entonces ven conmigo y encuentra esas respuestas!",DIA_Lester_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lester_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_00"); //�Entonces ven conmigo y encuentra esas respuestas!
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_01"); //Nos veremos en el puerto. Ir� por all� cuando est� listo.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02"); //R�pido, no tenemos mucho tiempo.
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Lester_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
};

FUNC VOID DIA_Lester_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_No_15_00"); //No te puedo llevar.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_01"); //Lo entiendo. Probablemente no te sea de gran ayuda.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_02"); //No importa a qui�n lleves contigo, pero aseg�rate de que puedes confiar en ellos.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_03"); //Y cu�date.

	Lester_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
};


///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_LeaveMyShip_Condition;
	information	 = 	DIA_Lester_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Al final resulta que no tengo sitio para ti.";
};
func int DIA_Lester_LeaveMyShip_Condition ()
{	
	if (Lester_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lester_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lester_LeaveMyShip_15_00"); //Al final resulta que no tengo sitio para ti.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_01"); //Lo entiendo. Probablemente har�a lo mismo en tu lugar.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_02"); //Si me necesitas, te ayudar�. Ya sabes d�nde encontrarme.
	
	Lester_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_StillNeedYou_Condition;
	information	 = 	DIA_Lester_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Necesito un amigo que te ayude.";
};
func int DIA_Lester_StillNeedYou_Condition ()
{	
	if ((Lester_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man nat�rlich nur eine variable abfragen
	|| (Lester_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lester_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lester_StillNeedYou_15_00"); //Necesito un amigo que me ayude.
	
	if (Lester_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_01"); //�Lo sab�a! Nos enfrentaremos a esto juntos, como en los viejos tiempos.
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_02"); //Ser� mejor que el mal se ande con ojo. Estamos pis�ndole los talones.
		
		self.flags 		 = NPC_FLAG_IMMORTAL;
		Lester_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
	
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	}
	else
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_03"); //Creo que lo mejor ser� que me quede aqu�. Buena suerte.
	
		AI_StopProcessInfos (self);
	};	
};

//#####################################################################
//##
//##
//##							KAPITEL 6 //auf der Dracheninsel ->Neue Instanz!!!
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Lester_KAP6_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP6_EXIT_Condition;
	information	= DIA_Lester_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_PC_Psionic_PICKPOCKET (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 900;
	condition	= DIA_PC_Psionic_PICKPOCKET_Condition;
	information	= DIA_PC_Psionic_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_PC_Psionic_PICKPOCKET_Condition()
{
	C_Beklauen (76, 20);
};
 
FUNC VOID DIA_PC_Psionic_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_PC_Psionic_PICKPOCKET);
	Info_AddChoice		(DIA_PC_Psionic_PICKPOCKET, DIALOG_BACK 		,DIA_PC_Psionic_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_PC_Psionic_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_PC_Psionic_PICKPOCKET_DoIt);
};

func void DIA_PC_Psionic_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_PC_Psionic_PICKPOCKET);
};
	
func void DIA_PC_Psionic_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_PC_Psionic_PICKPOCKET);
};




































