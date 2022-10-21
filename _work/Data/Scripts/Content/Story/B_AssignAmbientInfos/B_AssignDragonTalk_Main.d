// *************************************************************************
// 									Drachenfrage 1
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_1(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_1_Condition;
	information	= DIA_DragonTalk_Main_1_Info;
	permanent	= FALSE;
	description = "Che cosa vi ha fatto apparire qui?";
};                       

FUNC INT DIA_DragonTalk_Main_1_Condition()
{
	if (MIS_KilledDragons == 0)
	{
		return 1;
	};	
};

FUNC VOID DIA_DragonTalk_Main_1_Info()
{	

	AI_Output			(other, self, "DIA_DragonTalk_Main_1_15_00"); //Servo del Male, cosa ti ha fatto apparire qui? Sei venuto solo per spargere terrore e panico?
	AI_Output			(self, other, "DIA_DragonTalk_Main_1_20_01"); //Il significato recondito del nostro raduno in questo mondo ti rimarrà oscuro, mio piccolo umano.

	Info_AddChoice	(DIA_DragonTalk_Main_1, "Come posso far parlare gli altri draghi?", DIA_DragonTalk_Main_1_reden );
	Info_AddChoice	(DIA_DragonTalk_Main_1, "Cosa devo fare per eliminarvi di nuovo?", DIA_DragonTalk_Main_1_verbannen );

	DragonTalk_Exit_Free = TRUE;
};
func void DIA_DragonTalk_Main_1_verbannen ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_verbannen_15_00"); //In nome di Innos, cosa devo fare per cacciarti una volta per tutte dai regni degli umani?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_01"); //(ride) Prima di agire, devi capire il significato del nostro raduno.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_02"); //Ad ogni modo, nessuno sarà disposto a rivelartelo di sua spontanea volontà.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_03"); //Solo l'Occhio può sciogliere le nostre lingue e rivelarti i nostri veri obiettivi.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_04"); //In ogni caso, non ti servirà a niente una volta che sarai morto.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_05"); //Ci è già stato detto che hai scelto la strada del Cacciatore di Draghi.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_06"); //Di conseguenza abbiamo inviato la nostra progenie nel tuo mondo per assicurarci la continuità della nostra antica discendenza.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_07"); //Hai già perso, piccolo umano.
		
		Log_CreateTopic (TOPIC_DRACHENEIER, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER, LOG_RUNNING);
		B_LogEntry (TOPIC_DRACHENEIER,"Uno dei draghi ha mormorato qualcosa riguardo 'la discendenza' e la continuazione della propria linea ancestrale. "); 
	}
	else
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_08"); //L'Occhio ti ha garantito l'accesso, tuttavia sarà il combattimento a stabilire se sei o meno degno di me.
	};
};

func void DIA_DragonTalk_Main_1_reden ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_reden_15_00"); //Come posso far parlare gli altri draghi?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_01"); //Solo il mio cuore potrebbe aiutarti a ripristinare il potere dell'Occhio.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_02"); //Ma non riuscirai a strapparmelo.

};


// *************************************************************************
// 									Drachenfrage 2
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_2(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_2_Condition;
	information	= DIA_DragonTalk_Main_2_Info;
	permanent	= FALSE;
	description = "Chi vi ha mandato qui?";
};                       

FUNC INT DIA_DragonTalk_Main_2_Condition()
{
	if (MIS_KilledDragons == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_2_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_2_15_00"); //A quali ordini obbedisci? Chi ti ha mandato qui?
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_01"); //Il nostro futuro e la nostra prosperità sono controllati dal Padrone con la sua Parola del Potere. Presto nessuno sarà in grado di resistergli.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_02"); //Il suo lungo braccio già si protende dal Regno dei Morti. Gli spiriti della notte si riuniscono nella gioiosa attesa del suo arrivo.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_03"); //Egli schiaccerà voi esseri umani e governerà sul mondo.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_04"); //Al suo cospetto noi non siamo altro che strumenti per il suo potere creativo.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_05"); //Il Padrone verrà per risollevare dalle ceneri i vostri corpi afflitti e usarli per rimodellare il destino del mondo.

	B_LogEntry (TOPIC_DRACHENJAGD,"I draghi non sono liberi, ma servono un padrone di cui non sono disposti a raccontare nulla, se non alcune vaghe profezie. Il padrone verrà a distruggere il mondo e così via. La solita storia."); 
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 3
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_3(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_3_Condition;
	information	= DIA_DragonTalk_Main_3_Info;
	permanent	= FALSE;
	description = "Come posso sconfiggere il vostro maestro?";
};                       

FUNC INT DIA_DragonTalk_Main_3_Condition()
{
	if (MIS_KilledDragons == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_3_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_00"); //Come posso sconfiggere il vostro maestro?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_01"); //Egli è onnipotente e pressoché invincibile. Se tu dovessi essere così avventato da sfidarlo, andresti incontro a una morte lenta e dolorosa.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_02"); //Non è la prima volta che sento questa storia. Pressoché invincibile non significa che io non possa ucciderlo.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_03"); //Parla dunque: cosa devo fare?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_04"); //Per affrontare il mio padrone hai bisogno di cose che lui non sarebbe mai in grado di ottenere.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_05"); //E sarebbero?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_06"); //Devi trovare la miglior armatura conosciuta presso la tua comunità terrena e indossarla.

	if (other.guild == GIL_PAL) || (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_01"); //Ti serve una spada che sia stata benedetta dal tuo dio.
	}
	else if (other.guild == GIL_KDF) || (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_02"); //Hai bisogno di una runa che sia stata creata apposta per te.
	}
	else //Sld - Djg
	{	
		AI_Output (self, other, "DIA_Dragons_Add_20_00"); //Ti serve un'arma che sia stata realizzata apposta per te.
	};
	
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_08"); //Ma la condizione più difficile di tutte è che devi convincere cinque compagni a seguirti fino alla morte.
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_09"); //Solo allora potrai affrontare il Padrone.
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 4
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_4(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_4_Condition;
	information	= DIA_DragonTalk_Main_4_Info;
	permanent	= FALSE;
	description 	= "Come faccio a trovare il vostro maestro?";
};                       

FUNC INT DIA_DragonTalk_Main_4_Condition()
{
	if (MIS_KilledDragons == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_4_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_00"); //Come faccio a trovare il vostro Padrone?
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_01"); //Egli ha stabilito la sua dimora nella solida roccia delle Sale di Irdorath, e lì attende il suo destino.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_02"); //Fino a quando non riuscirà a riportare questo mondo all'ordine che si merita, egli aspetterà lì, assorto nella meditazione e...
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_03"); //Risparmiami i dettagli. Dimmi solo dove posso trovare queste sacre Sale di Irdorath.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_04"); //Ah ah ah. Tu mi deludi, piccolo uomo. Hai superato tutti i pericoli e sconfitto quasi tutti noi e ora non riesci a usare la conoscenza superiore.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_05"); //Se Irdorath non ti dice niente, allora faresti meglio ad andare dai tuoi maghi e chiedere il permesso di occuparti dei loro problemi terreni.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_06"); //È piuttosto evidente che non sei ancora pronto a sopportare il pesante fardello della loro conoscenza superiore.
	 
	Log_CreateTopic (TOPIC_BuchHallenVonIrdorath, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BuchHallenVonIrdorath, LOG_RUNNING);
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Si dice che il padrone dei draghi si sia rifugiato nelle sacre Sale di Irdorath. Mmh, mi ricorda qualcosa. Dove ho già letto quel nome?"); 

	B_NPC_IsAliveCheck (OLDWORLD_ZEN);  //Joly: bringt Angar und Gorn in die NW.
	DragonTalk_Exit_Free = TRUE;
};


//**********************************************************************************
//		B_AssignDragonTalk_Main
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Main (var c_NPC slf)
{
	DIA_DragonTalk_Main_1.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_2.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_3.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_4.npc				= Hlp_GetInstanceID(slf);	
};













