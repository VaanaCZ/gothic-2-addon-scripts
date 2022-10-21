///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Moe_EXIT   (C_INFO)
{
	npc         = VLK_432_Moe;
	nr          = 999;
	condition   = DIA_Moe_EXIT_Condition;
	information = DIA_Moe_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Moe_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Moe_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Moe_PICKPOCKET (C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 900;
	condition	= DIA_Moe_PICKPOCKET_Condition;
	information	= DIA_Moe_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Moe_PICKPOCKET_Condition()
{
	C_Beklauen (25, 30);
};
 
FUNC VOID DIA_Moe_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Moe_PICKPOCKET);
	Info_AddChoice		(DIA_Moe_PICKPOCKET, DIALOG_BACK 		,DIA_Moe_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Moe_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Moe_PICKPOCKET_DoIt);
};

func void DIA_Moe_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Moe_PICKPOCKET);
};
	
func void DIA_Moe_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Moe_PICKPOCKET);
};
// ************************************************************
// 			     Hallo
// ************************************************************
INSTANCE DIA_Moe_Hallo(C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 2;
	condition	= DIA_Moe_Hallo_Condition;
	information	= DIA_Moe_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       

FUNC INT DIA_Moe_Hallo_Condition()
{	
	if (Npc_GetDistToNpc(self, other) <= ZivilAnquatschDist)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_NOV)
	&& (Npc_RefuseTalk(self) == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Moe_Hallo_Info()
{
	AI_Output (self ,other,"DIA_Moe_Hallo_01_00"); //Oye, no te conozco. ¿Qué buscas aquí? ¿Te diriges a la taberna?
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"No, no me dirijo a la taberna... (FIN)",DIA_Moe_Hallo_Gehen);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Oh, así que éste es el abrevadero...",DIA_Moe_Hallo_Witz);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Sí, ¿te importa?",DIA_Moe_Hallo_Reizen);
};
FUNC VOID DIA_Moe_Hallo_Gehen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Gehen_15_00"); //No, no me dirijo a la taberna...
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_01"); //Ya, eso es lo que habría dicho yo. Pero eso no es importante. Y por eso es por lo que podemos ir directamente al grano.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_02"); //Como eres nuevo aquí, te haré una oferta. Me das 50 monedas de oro y te puedes ir.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_03"); //Ésa es tu cuota de entrada a la taberna.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Averigüemos qué piensa la milicia de eso...",DIA_Moe_Hallo_Miliz);
	Info_AddChoice    (DIA_Moe_Hallo,"Ni hablar, ¡no conseguirás ni una moneda!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"De acuerdo. Pagaré.",DIA_Moe_Hallo_Zahlen);
	Info_AddChoice    (DIA_Moe_Hallo,"¡Pero yo no quiero ir a la taberna!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Kneipe()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Kneipe_15_00"); //¡Pero yo no quiero ir a la taberna!
	AI_Output (self ,other,"DIA_Moe_Hallo_Kneipe_01_01"); //Ya sabes: tarde o temprano, todo el mundo quiere ir a la taberna. Así que si pagas ahora mismo, te lo habrás quitado de encima.
};
FUNC VOID  DIA_Moe_Hallo_Witz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Witz_15_00"); //Oh, así que éste es el abrevadero del puerto. Y allí estaba yo, creyendo que era el palacio del gobernador.
	AI_Output (self ,other,"DIA_Moe_Hallo_Witz_01_01"); //Oye, déjate de bromas malas, enano, o te vas a comer los adoquines.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Veo que tendré que zurrarte...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"¿Estás intentando meterme en problemas?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Cálmate, lo único que quiero es beber una cerveza.",DIA_Moe_Hallo_Ruhig);
	Info_AddChoice    (DIA_Moe_Hallo,"¡Pero yo no quiero ir a la taberna!",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Reizen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Reizen_15_00"); //Sí, ¿te importa?
	AI_Output (self ,other,"DIA_Moe_Hallo_Reizen_01_01"); //Aquí no pintas nada, enano.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Veo que tendré que zurrarte...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"¿Estás intentando meterme en problemas?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Cálmate, lo único que quiero es beber una cerveza.",DIA_Moe_Hallo_Ruhig);
};
FUNC VOID DIA_Moe_Hallo_Miliz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Miliz_15_00"); //Averigüemos qué piensa la milicia de eso...
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_01"); //(Se ríe) La milicia no está aquí. ¿Y sabes por qué no está aquí?
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_02"); //Éste es el distrito del puerto, enano. Ningún miliciano se pelearía conmigo aquí abajo.
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_03"); //Como mucho, irían a la 'Antorcha roja'. Así que ya ves, estamos solo nosotros. (Sonríe asquerosamente).
};
FUNC VOID DIA_Moe_Hallo_Pruegel()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Pruegel_15_00"); //Veo que tendré que zurrarte para poder hacer progresos.
	AI_Output (self ,other,"DIA_Moe_Hallo_Pruegel_01_01"); //Me gustaría que lo intentases, enano. ¡Enséñame de lo que eres capaz!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Aerger()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Aerger_15_00"); //¿Estás intentando meterme en problemas?
	AI_Output (self ,other,"DIA_Moe_Hallo_Aerger_01_01"); //Claro, soy un maestro en causar problemas. Así que defiéndete, enano.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Ruhig()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Ruhig_15_00"); //Cálmate, lo único que quiero es beber una cerveza.
	AI_Output (self ,other,"DIA_Moe_Hallo_Ruhig_01_01"); //De acuerdo, pero te costará 50 monedas de oro entrar. (Sonríe).
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Ni hablar, ¡no conseguirás ni una moneda!",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"De acuerdo. Pagaré.",DIA_Moe_Hallo_Zahlen);
	
};
FUNC VOID DIA_Moe_Hallo_Zahlen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_00"); //Vale, pagaré.
	
	if B_GiveInvItems (other, self, ItMi_Gold,50)
	{
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_01"); //Genial. Y como esto ha salido tan bien, ahora dame todo lo que lleves encima.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Ni hablar, ¡no conseguirás ni una moneda!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"Bien, esto es todo lo que tengo.",DIA_Moe_Hallo_Alles);
	}
	else if (Npc_HasItems (hero, ItMi_Gold) > 9)
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_02"); //… pero yo no llevo tanto dinero encima.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_03"); //Eso no importa. Dame todo lo que lleves contigo.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Ni hablar, ¡no conseguirás ni una moneda!",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"Bien, esto es todo lo que tengo.",DIA_Moe_Hallo_Alles);
	}
	else
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_04"); //… pero ni siquiera tengo 10 monedas de oro.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_05"); //Tío, pues sí que he pillado uno bueno.
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_06"); //De acuerdo, puedes largarte.
		
		AI_StopProcessInfos (self);
	};

};
FUNC VOID DIA_Moe_Hallo_Vergisses()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Vergisses_15_00"); //Ni hablar, ¡no conseguirás ni una moneda!
	AI_Output (self ,other,"DIA_Moe_Hallo_Vergisses_01_01"); //Entonces me llevaré todo lo que tienes, en cuanto estés en el suelo ante mí.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Alles()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Alles_15_00"); //Bien, esto es todo lo que tengo.
	
	B_GiveInvItems (other, self, ItMi_Gold, Npc_HasItems (other,ItMi_Gold));
	
	AI_Output (self ,other,"DIA_Moe_Hallo_Alles_01_01"); //De acuerdo, entonces, eso es todo. Yo siempre tan generoso. (Sonríe).
	AI_StopProcessInfos (self);
};
//************************************************
//	Das Hafenviertel
//************************************************

INSTANCE DIA_Moe_Harbor(C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 998;
	condition	= DIA_Moe_Harbor_Condition;
	information	= DIA_Moe_Harbor_Info;
	permanent	= TRUE;
	description = "Sabes orientarte por el puerto, ¿no?";
};                       

FUNC INT DIA_Moe_Harbor_Condition()
{
		return TRUE;
};
 
FUNC VOID DIA_Moe_Harbor_Info()
{	
	AI_Output (other,self ,"DIA_Moe_Harbor_15_00"); //Sabes orientarte por el puerto, ¿no?
	AI_Output (self ,other,"DIA_Moe_Harbor_01_01"); //Claro. ¿Por qué?
	
	Info_ClearChoices (DIA_Moe_Harbor);
	Info_AddChoice		(DIA_Moe_Harbor, DIALOG_BACK, DIA_Moe_Harbor_Back);
	Info_AddChoice		(DIA_Moe_Harbor,"¿Cómo va el tráfico portuario?",DIA_Moe_Harbor_Ship);
	Info_AddChoice		(DIA_Moe_Harbor,"¿Por qué no se ve a nadie de la milicia?",DIA_Moe_Harbor_Militia);
	Info_AddChoice 		(DIA_Moe_Harbor,"¿Qué clases de rumores flotan por el aire?",DIA_Moe_Harbor_Rumors);
};

FUNC VOID DIA_Moe_Harbor_Back ()
{
	Info_ClearChoices (DIA_Moe_Harbor);
};

FUNC VOID DIA_Moe_Harbor_Ship ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Ship_15_00"); //¿Cómo va el tráfico portuario?
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_01"); //El único barco que ha venido recientemente es el barco de los paladines.
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_02"); //Está por ahí, detrás de la cresta rocosa, al suroeste.
	
};

FUNC VOID DIA_Moe_Harbor_Militia ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Militia_15_00"); //¿Por qué no se ve a nadie de la milicia?
	AI_Output (self ,other,"DIA_Moe_Harbor_Militia_01_01"); //No se atreven a entrar aquí. Nos ocupamos de las cosas nosotros solos.
};

FUNC VOID DIA_Moe_Harbor_Rumors ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_00"); //¿Qué clases de rumores flotan por el aire?
	
	if (Kapitel == 1)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_01"); //Por aquí no nos gusta mucho la gente que hace demasiadas preguntas. Especialmente si son extraños.
	}
	else if (Kapitel == 2)
	{
		if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_02"); //Nada, ¿qué iba a pasar? Aquí todo está tranquilo.
		}
		else if (hero.guild == GIL_KDF)
		|| (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_03"); //(Pensativo) La cosa va mal. Son tiempos difíciles y todos intentamos aguantar en la cuerda floja.
			AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_04"); //Deja de reírte de mí.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_05"); //¿Cómo puedes pensar algo así de mí? Estoy profundamente herido.
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_06"); //Las cosas están muy calientes. Lord Andre lleva un tiempo intentando meter su nariz en cosas que no le conciernen.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_07"); //Esos pijos nunca entenderán cómo funcionan las cosas aquí abajo.
		};
		
	}
	else if (Kapitel == 3)
	{
		if (Mis_RescueBennet == LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			|| (hero.guild == GIL_KDF)
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_08"); //No tenemos nada que ver con ese asunto.
				AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_09"); //¿Qué asunto?
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_10"); //Con ese paladín al que asesinaron allá arriba. Deberías preocuparte de los mercenarios, en lugar de perder el tiempo aquí abajo.
			}
			else
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_11"); //Ya sé que no tuvisteis nada que ver con ello, pero el asesino del paladín ha asustado en serio a los buenos caballeros.
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_12"); //Si quieres un consejo, entre amigos, lárgate de la ciudad. Al menos durante un tiempo.
			};	
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_13"); //Desde que se filtró que los mercenarios no se habían cargado al paladín, la milicia no se atreve ni a asomarse por aquí.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_14"); //Creo que tienen miedo de que les partan la cara. Por mí, mejor.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_15"); //Aquí no ocurre absolutamente nada.
	}
	else //Kapitel 5
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_16"); //Por fin esos paladines creídos están abandonando el puerto. Ya era hora.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LehmarGeldeintreiben
///////////////////////////////////////////////////////////////////////
instance DIA_Moe_LEHMARGELDEINTREIBEN		(C_INFO)
{
	npc			 = 	VLK_432_Moe;
	nr			 =  2;
	condition	 = 	DIA_Moe_LEHMARGELDEINTREIBEN_Condition;
	information	 = 	DIA_Moe_LEHMARGELDEINTREIBEN_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Moe_LEHMARGELDEINTREIBEN_Condition ()
{
	if 	((Lehmar_GeldGeliehen_Day <= (Wld_GetDay()-2))
	&&   (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	&& (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Moe_LEHMARGELDEINTREIBEN_Info ()
{
	AI_Output (self, other, "DIA_Moe_LEHMARGELDEINTREIBEN_01_00"); //¡Eh, tú! Lehmar te saluda.

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};







