import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'm_n_m_response_model.dart';
export 'm_n_m_response_model.dart';

class MNMResponseWidget extends StatefulWidget {
  const MNMResponseWidget({
    Key? key,
    this.fname,
    this.lname,
    this.email2,
    this.status2,
    this.authstuff,
    String? sortID,
    String? order,
  })  : this.sortID = sortID ?? 'first_name',
        this.order = order ?? 'ASC',
        super(key: key);

  final String? fname;
  final String? lname;
  final String? email2;
  final String? status2;
  final String? authstuff;
  final String sortID;
  final String order;

  @override
  _MNMResponseWidgetState createState() => _MNMResponseWidgetState();
}

class _MNMResponseWidgetState extends State<MNMResponseWidget> {
  late MNMResponseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MNMResponseModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultwkc = await GetMNMCall.call(
        firstname: FFAppState().fNameV,
        lastname: FFAppState().lNameV,
        email: FFAppState().emailV,
        status2: widget.status2,
        authtoken: FFAppState().authTokenV,
        sortID: FFAppState().sortIDV,
        order: FFAppState().orderV,
      );
      if ((_model.apiResultwkc?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'success',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0x00000000),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Search Results',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryBtnText,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_sharp,
              color: FlutterFlowTheme.of(context).primaryBtnText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('Search');
            },
          ),
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.logout,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 30.0,
            ),
            onPressed: () async {
              setState(() {
                FFAppState().authTokenV = '';
              });

              context.pushNamed('SignIn');
            },
          ),
        ],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Sort By:',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 24.0,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              FFAppState().sortIDV = 'first_name';
                            });

                            context.pushNamed('MNMResponse');
                          },
                          child: Text(
                            'First Name',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              FFAppState().sortIDV = 'last_name';
                            });

                            context.pushNamed('MNMResponse');
                          },
                          child: Text(
                            'Last Name',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              FFAppState().sortIDV = 'email';
                            });

                            context.pushNamed('MNMResponse');
                          },
                          child: Text(
                            'Email',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              FFAppState().sortIDV = 'account_id';
                            });

                            context.pushNamed('MNMResponse');
                          },
                          child: Text(
                            'Account ID',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              FFAppState().sortIDV = 'print_status';
                            });

                            context.pushNamed('MNMResponse');
                          },
                          child: Text(
                            'Status',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Text(
                            'First Name',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Text(
                          'Last Name',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Text(
                            'Email',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Text(
                          'Account ID',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
                RefreshIndicator(
                  onRefresh: () async {
                    setState(() => _model.pagingController?.refresh());
                    await _model.waitForOnePage();
                  },
                  child: PagedListView<ApiPagingParams, dynamic>(
                    pagingController: () {
                      if (_model.pagingController != null) {
                        return _model.pagingController!;
                      }

                      _model.pagingController = PagingController(
                        firstPageKey: ApiPagingParams(
                          nextPageNumber: 0,
                          numItems: 0,
                          lastResponse: null,
                        ),
                      );
                      _model.pagingController!
                          .addPageRequestListener((nextPageMarker) {
                        GetMNMCall.call(
                          firstname: FFAppState().fNameV,
                          lastname: FFAppState().lNameV,
                          email: FFAppState().emailV,
                          status2: FFAppState().statusV,
                          sortID: FFAppState().sortIDV,
                          order: FFAppState().orderV,
                          authtoken: FFAppState().authTokenV,
                          nextPage: nextPageMarker.nextPageNumber,
                          numLoadedItems: nextPageMarker.numItems,
                        ).then((listViewGetMNMResponse) {
                          final pageItems = getJsonField(
                            listViewGetMNMResponse.jsonBody,
                            r'''$..recordset''',
                          ).toList() as List;
                          final newNumItems =
                              nextPageMarker.numItems + pageItems.length;
                          _model.pagingController!.appendPage(
                            pageItems,
                            (pageItems.length > 0)
                                ? ApiPagingParams(
                                    nextPageNumber:
                                        nextPageMarker.nextPageNumber + 1,
                                    numItems: newNumItems,
                                    lastResponse: listViewGetMNMResponse,
                                  )
                                : null,
                          );
                        });
                      });
                      return _model.pagingController!;
                    }(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    builderDelegate: PagedChildBuilderDelegate<dynamic>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: SpinKitWave(
                            color: Colors.white,
                            size: 40.0,
                          ),
                        ),
                      ),

                      itemBuilder: (context, _, recordIndex) {
                        final recordItem =
                            _model.pagingController!.itemList![recordIndex];
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 5.0, 5.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Text(
                                    getJsonField(
                                      recordItem,
                                      r'''$.first_name''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 5.0, 5.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height: 20.0,
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width * 0.3,
                                    maxHeight:
                                        MediaQuery.of(context).size.height *
                                            0.2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Text(
                                    getJsonField(
                                      recordItem,
                                      r'''$.last_name''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 5.0, 5.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Text(
                                    getJsonField(
                                      recordItem,
                                      r'''$.email''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 5.0, 5.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Text(
                                    getJsonField(
                                      recordItem,
                                      r'''$.account_id''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
