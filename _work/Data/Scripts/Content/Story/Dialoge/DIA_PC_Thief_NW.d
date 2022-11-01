
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_DiegoNW_EXIT(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 999;
	condition	= DIA_DiegoNW_EXIT_Condition;
	information	= DIA_DiegoNW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_DiegoNW_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_DiegoNW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//######################################
//##
//##	Permanent Info
//##
//######################################


// ************************************************************
// 	  	  Wie laufen die Geschäfte? (perm)
// ************************************************************

INSTANCE DIA_DiegoNW_Perm(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 998;
	condition	= DIA_DiegoNW_Perm_Condition;
	information	= DIA_DiegoNW_Perm_Info;
	permanent	= TRUE;

	description = "¿Qué tal va el negocio?";
};                       
FUNC INT DIA_DiegoNW_Perm_Condition()
{
	if (Diego_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_Perm_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_Perm_15_00"); //¿Qué tal el negocio?
	AI_Output (self ,other,"DIA_DiegoNW_Perm_11_01"); //Ruinoso. Alguien me debería haber advertido de que Khorinis se había ido al cuerno.
	AI_Output (other,self ,"DIA_DiegoNW_Perm_15_02"); //Ni idea, siempre he conocido la ciudad como es ahora.
	AI_Output (self ,other,"DIA_DiegoNW_Perm_11_03"); //Tendrías que haberla visto hace unos años. Te habría gustado.
};


//######################################
//##
//##	Kapitel 3
//##
//######################################

// ************************************************************
// 	  	  Ich brauche deine Hilfe.
// ************************************************************

INSTANCE DIA_DiegoNW_NeedHelp(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 1;
	condition	= DIA_DiegoNW_NeedHelp_Condition;
	information	= DIA_DiegoNW_NeedHelp_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_DiegoNW_NeedHelp_Condition()
{
	if (Diego_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_NeedHelp_Info()
{	
	if (Diego_IsDead == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_01"); //¡Eh, pareces totalmente sorprendido!
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_02"); //(ríe) Creías que la había palmado, ¿verdad?
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_03"); //Pasé un tiempo inconsciente, pero, como ves, aún sigo vivo.
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_04"); //Lo importante es que estamos aquí los dos.
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_05"); //Tienes que ayudarme.
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_11_00"); //Me alegro de que estés aquí. Tienes que ayudarme.
	};
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
	
	if (DiegoOW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	//	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Wer bist du?",DIA_DiegoNW_NeedHelp_WhoAreYou);//Joly:macht keinen Sinn. Ohne mit Diego gesprochen zu haben -> Kein DiegoNW !! Hauptstory Kapitel 2 OW!!!!
	};
	
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"¿Qué ropas son esas?",DIA_DiegoNW_NeedHelp_Clothes);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"¿Qué estás haciendo aquí?",DIA_DiegoNW_NeedHelp_Plan);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"¿De qué va esto?",DIA_DiegoNW_NeedHelp_Problem);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Plan()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Plan_15_00"); //¿Qué haces aquí?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Plan_11_01"); //He estado observando a los guardias. Parece que están alerta.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Plan_11_02"); //No creo que me fuera fácil pasar por allí.
};

FUNC VOID DIA_DiegoNW_NeedHelp_WhoAreYou()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00"); //¿Quién eres tú?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01"); //Seguro que es por mis ropas. Los guardias no quieren dejarme entrar en la ciudad.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02"); //Por eso le compré esta ropa a un comerciante, fuera de la ciudad. Espero que te acuerdes de mí. Soy Diego.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03"); //En la trena te enseñé todo lo necesario para sobrevivir.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04"); //No puedes haberlo olvidado todo.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05"); //Esto... ¿qué fue exactamente lo que pasó?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06"); //Madre mía, es verdad que no te acuerdas de nada.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07"); //Escucha, ahora no tengo tiempo de explicártelo todo. Solo te puedo decir que éramos muy buenos amigos y te salvé la vida más de una vez.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08"); //Y ahora necesito tu ayuda.
};

FUNC VOID DIA_DiegoNW_NeedHelp_Clothes()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Clothes_15_00"); //¿Qué ropas son ésas?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01"); //Se las compré a un comerciante, fuera de la ciudad. Al principio, los guardias no querían dejarme pasar.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02"); //Y, además, no hace falta que todo el mundo se entere de dónde vengo.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Clothes_15_03"); //En eso tienes razón.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04"); //Eso es lo que creo. Pero aunque me quite mis ropas de sombra, sigo siendo el mismo.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05"); //Y tengo grandes planes para esta ciudad.
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem ()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_15_00"); //¿A qué te refieres?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_01"); //Han cambiado muchas cosas desde que me fui de aquí. Tengo que recuperar el tiempo perdido.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_15_02"); //¿Cuál es el problema?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_03"); //Tengo que entrar en el barrio alto.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_04"); //No soy ciudadano y no tengo dinero suficiente para sobornar a los guardias. ¡Y ahí es donde entras tú!
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_15_05"); //¿Así que quieres que te deje algo de oro?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_06"); //Vaya tontería. Yo tengo oro, y diría que bastante. Por desgracia, no lo tengo aquí.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_07"); //Necesito que me recuperes el oro.
	
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"No tengo tiempo para eso.",DIA_DiegoNW_NeedHelp_Problem_NoTime);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"¿Qué obtengo yo a cambio?",DIA_DiegoNW_NeedHelp_Problem_Reward);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Bien, te ayudaré.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_NoTime()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00"); //No tengo tiempo para eso.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01"); //Eh, ¡creía que éramos colegas! Al fin y al cabo, fui yo quien te salvó el culo cuando te metieron en la colonia.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02"); //Exageras.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03"); //¿Ah, sí? Entonces piensa durante un minuto qué habría pasado si no te hubiera explicado cómo debías comportarte.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04"); //Los magnates del mineral te habrían comido vivo y habrías muerto de manera lamentable en la mina.

	MIS_HelpDiegoNW = LOG_FAILED;
	
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_Reward()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00"); //¿Y qué gano yo?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01"); //¿Alguna vez te he pedido que me pagaras algo? Somos amigos, ¿es que eso no es suficiente?
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00"); //Bien, te ayudaré.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01"); //Mira, escucha. Cuando la Barrera aún seguía en pie, escondí un pequeño tesoro.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02"); //Ha pasado mucho tiempo. Por eso olvidé llevármelo conmigo.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03"); //Y ahora no me puedo marchar de aquí.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03"); //Abreviando, tienes que ir al Valle de las Minas y recuperar mi oro.

	MIS_HelpDiegoNW = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HelpDiegoNW,LOG_RUNNING);
	B_LogEntry (TOPIC_HelpDiegoNW,"El oro de Diego está en el Valle de las Minas. Lo necesito para llegar al barrio alto y me ha enviado para que lo recoja.");
	
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"¿Qué vas a hacer con el oro?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"¿De dónde sacaste todo ese oro?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"¿Dónde está escondido el oro?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00"); //¿Qué vas a hacer con el oro?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01"); //Aún tengo una cuenta que saldar con un mercader del barrio alto. Tengo que encargarme de ello.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02"); //¡Después podré dedicarme a una nueva carrera!
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00"); //¿De dónde sacaste todo ese oro?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01"); //¿Es que soy el único que se guardó algo de oro en el Valle de las Minas?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02"); //Sisar algunas pepitas fue de lo más fácil. Solo por si alguna vez salía de allí.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03"); //Todos valoraban tanto ese mineral que nadie le prestaba atención al oro 
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00"); //¿Dónde está escondido el oro?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01"); //Justo en la plaza del mercado, encima de la mina abandonada. Está en una bolsa de cuero.
	if (Diego_angekommen == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01"); //Ahórrate el comentario. Estoy seguro de que hemos pasado por su lado.
		AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02"); //Tráeme la bolsa.
	};
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02"); //Pero no te olvides de comprobar que es la correcta, para que no te hagas todo el camino a lo tonto.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03"); //¿Cómo la reconoceré?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04"); //Está llena de oro. ¡Un montón de oro!
					
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Intentaré encontrar tu oro.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt);		
	
	B_LogEntry (TOPIC_HelpDiegoNW,"El oro de Diego está en algún lugar de la antigua plaza del mercado, por encima de la mina, desde el que se enviaban mercancías a la colonia mediante un cable.");
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt ()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00"); //Intentaré encontrar tu oro.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01"); //(Sonríe irónicamente) Hazlo. Con eso me basta.

	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
};

//***********************************************
//	Ok, ich werde dir doch helfen.
//***********************************************

INSTANCE DIA_DiegoNW_HelpYou(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 30;
	condition	= DIA_DiegoNW_HelpYou_Condition;
	information	= DIA_DiegoNW_HelpYou_Info;
	permanent	= FALSE;
	description	= "De acuerdo, después de todo, te ayudaré.";
};                       
FUNC INT DIA_DiegoNW_HelpYou_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	&& (MIS_HElpDiegoNW == LOG_FAILED) 
	&& (Diego_IsOnBOard != LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_HelpYou_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_HelpYou_15_00"); //De acuerdo, te ayudaré .
	AI_Output (self ,other,"DIA_DiegoNW_HelpYou_11_01"); //Lo sabía.
	AI_Output (other,self ,"DIA_DiegoNW_HelpYou_15_02"); //Vale. Centrémonos en los negocios.
	AI_Output (self ,other,"DIA_DiegoNW_HelpYou_11_03"); //De acuerdo. He escondido un tesoro en el Valle de las Minas y debes ir a traérmelo.
	AI_Output (self ,other,"DIA_DiegoNW_HelpYou_11_06"); //Mientras tanto me quedaré aquí a prepararlo todo.
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt();

	MIS_HelpDiegoNW = LOG_RUNNING;
	Log_CreateTopic (TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HelpDiegoNW,LOG_RUNNING);
	B_LogEntry (TOPIC_HelpDiegoNW,"El oro de Diego está en el Valle de las Minas. Lo necesito para llegar al barrio alto y me ha enviado para que lo recoja.");
};

//***********************************************
//	Ich habe dein Gold gefunden!
//***********************************************

INSTANCE DIA_DiegoNW_HaveYourGold(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 31;
	condition	= DIA_DiegoNW_HaveYourGold_Condition;
	information	= DIA_DiegoNW_HaveYourGold_Info;
	permanent	= TRUE;
	description	= "¡He encontrado tu oro!";
};            

FUNC INT DIA_DiegoNW_HaveYourGold_Condition()
{
	if ((OpenedDiegosBag == TRUE)
	|| (Npc_HasItems (other,ItSe_DiegosTreasure_Mis) >=1))
	&& (MIS_HelpDiegoNW == LOG_RUNNING)
	&& (Diego_IsOnBOard != LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID B_DIEGONW_DIEGOSREVENGE ()
{
	AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_05"); //Muy bien. Ahora más le vale a Gerbrandt andarse con ojo.
};

var int DiegosRevenge;

FUNC VOID DIA_DiegoNW_HaveYourGold_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_HaveYourGold_15_00"); //¡He encontrado tu oro!
	AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_01"); //Estupendo. Enséñamelo.
	
	IF (Npc_HasItems (other,ItSe_DiegosTreasure_Mis) >=1)
	{
		B_GiveInvItems (other,self ,ItSe_DiegosTreasure_Mis,1);
		B_DIEGONW_DIEGOSREVENGE ();
		DiegosRevenge = TRUE;
	}
	else if (Npc_HasItems (other,ItMi_Gold < DiegosTreasure))
	{
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_02"); //¡Pero no está todo! ¿No te fías de mí? Lo necesito todo.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_03"); //Si me plan funciona, quedará suficiente para ti.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_04"); //Así que asegúrate de que consigo todo. ¡Es importante!
	}
	else
	{
		B_GiveInvItems (other,self ,ItMi_Gold,DiegosTreasure);
		B_DIEGONW_DIEGOSREVENGE ();
		DiegosRevenge = TRUE;
	};	
	
	if (Npc_IsDead (Gerbrandt) == FALSE)
	&& (DiegosRevenge == TRUE)
	{
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_06"); //Escucha, sigo necesitando que alguien se encargue de los guardias.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_07"); //Quiero que le lleves esta carta a Gerbrandt. Es uno de los mercaderes sebosos del barrio alto.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_08"); //Salúdale de mi parte. Nos encontraremos enfrente de la casa de Gerbrandt.

		CreateInvItems (self ,ItWr_DiegosLetter_MIS,1);
		B_GiveInvItems (self,other,ItWr_DiegosLetter_MIS,1);
		
		B_StartOtherRoutine (Gerbrandt,"WaitForDiego");
		
		MIS_HelpDiegoNW = LOG_SUCCESS;
		MIS_DiegosResidence = LOG_RUNNING;
		B_GivePlayerXP (XP_HelpDiegoNW);

		Log_CreateTopic (TOPIC_DiegosResidence,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_DiegosResidence,LOG_RUNNING);
		B_LogEntry (TOPIC_DiegosResidence,"Diego me ha dado una carta para Gerbrandt.");
		
		AI_StopProcessInfos (self);
	};		
		
	
};


//***********************************************
//	Ich habe den Brief abgeliefert.
//***********************************************

INSTANCE DIA_DiegoNW_DeliveredLetter(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 30;
	condition	= DIA_DiegoNW_DeliveredLetter_Condition;
	information	= DIA_DiegoNW_DeliveredLetter_Info;
	permanent	= FALSE;
	description	= "He entregado la carta.";
};
                       
FUNC INT DIA_DiegoNW_DeliveredLetter_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	&& (MIS_DiegosResidence == LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_Info()
{
		
	AI_Output (other,self ,"DIA_DiegoNW_DeliveredLetter_15_00"); //He entregado la carta.
	AI_Output (self ,other,"DIA_DiegoNW_DeliveredLetter_11_01"); //Estupendo. ¿Qué tal se la tomó Gerbrandt?
	AI_Output (other,self ,"DIA_DiegoNW_DeliveredLetter_15_02"); //Se llevó una impresión y no tardó en esfumarse.
	AI_Output (self ,other,"DIA_DiegoNW_DeliveredLetter_11_03"); //(Satisfecho) No me extraña.
	AI_Output (self ,other,"DIA_DiegoNW_DeliveredLetter_11_04"); //Me temo que, antes de nada, tengo que amueblar mi nueva casa. Si no recuerdo mal, el gusto de Gerbrandt es lo peor.
	  
	B_GivePlayerXP (XP_DiegoHasANewHome);

	Wld_AssignRoomToGuild ("reich01",		GIL_PUBLIC);

	Info_ClearChoices (DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"¿Y cómo lo has conseguido?",DIA_DiegoNW_DeliveredLetter_YourTrick);	
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"¿Entonces la casa es tuya?",DIA_DiegoNW_DeliveredLetter_YourHouse);
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_Gerbrandt ()
{
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00"); //¿Qué hay de Gerbrandt?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01"); //Ya se ha dado la gran vida durante demasiado tiempo.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02"); //Vivía aquí a todo lujo, mientras yo tragaba estofado de sabandija de carne.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03"); //No sé de dónde vino, pero nunca volverá a Khorinis. Me ocuparé de ello.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04"); //Si le buscas, prueba en el distrito portuario.
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourHouse()
{
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00"); //¿Entonces la casa es tuya?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01"); //Sí, toda mía, y amueblada.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02"); //Después de varios años en alojamientos poco confortables, estoy deseando dormir en una blanda cama de dosel.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03"); //Y, para desayunar, tomaré buen vino y algo de jamón de primera.
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04"); //No pierdes ninguna oportunidad, ¿verdad?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05"); //Y que lo digas.
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourTrick ()
{
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00"); //¿Y cómo lo has conseguido?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01"); //¿Crees que Gerbrandt consiguió su fortuna de manera honesta?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02"); //Por supuesto, nunca se ensució las manos. Tenía alguien que lo hacía por él.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03"); //Por supuesto, en aquel entonces me enteré de muchas cosas, y. Gerbrandt acabó librándose de mí. Seguramente tenía miedo de que supiera demasiado.
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04"); //Nunca me lo habías dicho.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05"); //Nunca me lo preguntaste.
	
	Info_ClearChoices (DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,DIALOG_BACK,DIA_DiegoNW_DeliveredLetter_YourTrick_BACK);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"¿Y qué hay de mi parte?",DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"¿Qué hay de Gerbrandt?",DIA_DiegoNW_DeliveredLetter_Gerbrandt);
}; 

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD()
{

	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00"); //¿Y qué hay de mi parte?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01"); //Parece que a fin de cuentas no te has olvidado de todo lo que te enseñé.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02"); //Pero tienes razón, no podría haberlo hecho sin tu ayuda. Toma tu parte.
	
	CreateInvItems (self ,ItMi_Gold,500);
	B_GiveInvItems (self,other,ItMi_Gold,500);
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourTrick_BACK()
{
	Info_ClearChoices (DIA_DiegoNW_DeliveredLetter);
};


// ************************************************************
// 	  	  Kannst du mir was beibringen?
// ************************************************************

//---------------------------
var int Diego_Teach;
//---------------------------

INSTANCE DIA_DiegoNW_CanYouTeach(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 995;
	condition	= DIA_DiegoNW_CanYouTeach_Condition;
	information	= DIA_DiegoNW_CanYouTeach_Info;
	permanent	= TRUE;

	description = "¿Puedes enseñarme algo?";
};                       
FUNC INT DIA_DiegoNW_CanYouTeach_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	&& (Diego_Teach == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_CanYouTeach_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_CanYouTeach_15_00"); //¿Puedes enseñarme algo?
	if (Npc_KnowsInfo (other,DIA_DiegoNW_DeliveredLetter))
	{
		AI_Output (self ,other,"DIA_DiegoNW_CanYouTeach_11_01"); //Sí, claro. Solo tienes que avisarme cuando estés listo.
		
		Diego_Teach = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoNW_CanYouTeach_11_02"); //Antes tengo que atender mi negocio.
	};
};



// ************************************************************
// 	  	  Bring mir was bei.
// ************************************************************

//-----------------------
var int DiegoNW_Merke_DEX;
//-------------------------

INSTANCE DIA_DiegoNW_Teach(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 995;
	condition	= DIA_DiegoNW_Teach_Condition;
	information	= DIA_DiegoNW_Teach_Info;
	permanent	= TRUE;

	description = "Enséñame algo.";
};                       
FUNC INT DIA_DiegoNW_Teach_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	&& (Diego_Teach == TRUE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_Teach_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_Teach_15_00"); //Enséñame.
	AI_Output (self ,other,"DIA_DiegoNW_Teach_11_01"); //Te puedo enseñar a ser más diestro.
	
	DiegoNW_Merke_Dex = other.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(DIA_DiegoNW_Teach);
	Info_AddChoice		(DIA_DiegoNW_Teach, DIALOG_BACK, DIA_DiegoNW_Teach_BACK);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_Teach_BACK()
{
	if (DiegoNW_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output (self, other, "DIA_DiegoNW_Teach_BACK_11_00"); //Ya te has vuelto más diestro. ¡Sigue así!
	};
	Info_ClearChoices	(DIA_DiegoNW_Teach);
};

// ------ 1 Geschick -----
func void DIA_DiegoNW_TeachDEX_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX);

	Info_ClearChoices	(DIA_DiegoNW_Teach);
	Info_AddChoice		(DIA_DiegoNW_Teach, DIALOG_BACK, DIA_DiegoNW_Teach_BACK);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoNW_TeachDEX_5);
};

// ------ 5 Geschick ------
func void DIA_DiegoNW_TeachDEX_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX);
	
	Info_ClearChoices	(DIA_DiegoNW_Teach);
	Info_AddChoice		(DIA_DiegoNW_Teach, DIALOG_BACK, DIA_DiegoNW_Teach_BACK);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoNW_TeachDEX_5);
};

//######################################
//##
//##	Kapitel 5
//##
//######################################

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_DiegoNW_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Thief_NW;
	nr			 = 	55;
	condition	 = 	DIA_DiegoNW_KnowWhereEnemy_Condition;
	information	 = 	DIA_DiegoNW_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Voy a abandonar Khorinis.";
};

func int DIA_DiegoNW_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Diego_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_DiegoNW_KnowWhereEnemy_15_00"); //Voy a abandonar Khorinis.
	AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_01"); //Una decisión inteligente. Ojalá pudiera irme contigo. Esta ciudad ha cambiado demasiado deprisa. Se acabaron los tiempos en los que te podías hacer rico rápidamente.
	AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_02"); //Te puedo enseñar tiro con arco, a forzar cerraduras y destreza
	AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_03"); //Claro, estoy seguro de que te viene bien un ladrón ducho.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   	
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
	B_LogEntry (TOPIC_Crew,"Por supuesto, Diego quiere venir. Tal y como lo ve él, cuanto antes salga de Khorinis, mejor. Podría enseñarme a ser más diestro y entrenarme para ser un buen arquero. También puede enseñarme a forzar cerraduras.");	
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_DiegoNW_KnowWhereEnemy_15_04"); //Me lo pensaré. Por el momento, no me hacen falta más tripulantes.
		AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_05"); //Tómate tu tiempo. No me voy a ir a ningún sitio.
	}
	else 
	{
		Info_ClearChoices (DIA_DiegoNW_KnowWhereEnemy);
		Info_AddChoice (DIA_DiegoNW_KnowWhereEnemy,"Quizá te avise cuando sea el momento.",DIA_DiegoNW_KnowWhereEnemy_No);
		Info_AddChoice (DIA_DiegoNW_KnowWhereEnemy,"¿Por qué no te vienes?",DIA_DiegoNW_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_DiegoNW_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00"); //¿Por qué no vienes conmigo? Nos encontraremos en el puerto.
	AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01"); //Mmm. Tienes razón, Khorinis es un basurero. Me voy contigo.
	
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	
	B_GivePlayerXP (XP_Crewmember_Success); 
	
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_CITY_UPTOWN_PATH_23" )== 1)
    {
		AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02"); //Espera, en un segundo estaré listo.
		AI_SetWalkmode 	(self, NPC_WALK);		
		AI_GotoWP (self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems (self,ItAR_Diego,1);
		AI_EquipArmor (self,ItAr_Diego);
		AI_Wait (self ,1);
		AI_GotoWP (self,self.wp);
	};
	
	AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03"); //Bien, estoy preparado. Te veré en el barco.
	
	
	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine (self,"SHIP"); 
	}
	else
	{
		Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
	};

	Info_ClearChoices (DIA_DiegoNW_KnowWhereEnemy);
};

FUNC VOID DIA_DiegoNW_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_DiegoNW_KnowWhereEnemy_No_15_00"); //Ya te avisaré cuando llegue el momento.
	AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01"); //Hazlo. Y puede que incluso vaya contigo. ¿Quién sabe?

	Diego_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_DiegoNW_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_DiegoNW_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Thief_NW;
	nr			 = 	55;
	condition	 = 	DIA_DiegoNW_LeaveMyShip_Condition;
	information	 = 	DIA_DiegoNW_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Encárgate de la ciudad.";
};
func int DIA_DiegoNW_LeaveMyShip_Condition ()
{	
	if (Diego_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_DiegoNW_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_DiegoNW_LeaveMyShip_15_00"); //Encárgate de la ciudad.
	AI_Output			(self, other, "DIA_DiegoNW_LeaveMyShip_11_01"); //¿De verdad? ¿Ya no me necesitas? Oh, bien. No te olvides de pasar a saludar cuando vuelvas a la ciudad.
	AI_Output			(other, self, "DIA_DiegoNW_LeaveMyShip_15_02"); //¿Crees que nos volveremos a encontrar?
	AI_Output			(self, other, "DIA_DiegoNW_LeaveMyShip_11_03"); //Nunca olvidaré la cara que tenías cuando nos conocimos, después de que Bullit te tumbara.
	AI_Output			(self, other, "DIA_DiegoNW_LeaveMyShip_11_04"); //No pueden ganarte la batalla. Nos volveremos a encontrar. Cuídate.
	
	
	Diego_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"Start"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_DiegoNW_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Thief_NW;
	nr			 = 	55;
	condition	 = 	DIA_DiegoNW_StillNeedYou_Condition;
	information	 = 	DIA_DiegoNW_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Vuelve. Quiero que me acompañes.";
};

func int DIA_DiegoNW_StillNeedYou_Condition ()
{	
	if ((Diego_IsOnBOard == LOG_OBSOLETE)	
	|| (Diego_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_DiegoNW_StillNeedYou_15_00"); //Vuelve. Quiero que me acompañes.
	AI_Output	(self, other, "DIA_DiegoNW_StillNeedYou_11_01"); //¿Qué ha pasado con tu decisión, amigo mío? Claro que iré contigo, pero decídete de una vez.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_CITY_UPTOWN_PATH_23" )== 1)
    {
		AI_Output (self ,other,"DIA_DiegoNW_StillNeedYou_11_02"); //Espera, en un segundo estaré listo.
		AI_GotoWP (self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems (self,ItAR_Diego,1);
		AI_EquipArmor (self,ItAr_Diego);
		AI_GotoWP (self,self.wp);
	};
	
	AI_Output	(self, other, "DIA_DiegoNW_StillNeedYou_11_03"); //De acuerdo, vámonos.
	
	AI_StopProcessInfos (self);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine (self,"SHIP"); 
	}
	else
	{
		Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thief_NW_PICKPOCKET (C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 900;
	condition	= DIA_Thief_NW_PICKPOCKET_Condition;
	information	= DIA_Thief_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Thief_NW_PICKPOCKET_Condition()
{
	C_Beklauen (120, 600);
};
 
FUNC VOID DIA_Thief_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thief_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Thief_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Thief_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thief_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thief_NW_PICKPOCKET_DoIt);
};

func void DIA_Thief_NW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thief_NW_PICKPOCKET);
};
	
func void DIA_Thief_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thief_NW_PICKPOCKET);
};


