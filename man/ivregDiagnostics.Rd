% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ivregDiagnostics.R
\name{influence.ivreg}
\alias{influence.ivreg}
\alias{ivregDiagnostics}
\alias{rstudent.ivreg}
\alias{cooks.distance.ivreg}
\alias{dfbeta.influence.ivreg}
\alias{hatvalues.ivreg}
\alias{rstudent.influence.ivreg}
\alias{hatvalues.influence.ivreg}
\alias{cooks.distance.influence.ivreg}
\alias{qqPlot.ivreg}
\alias{qqPlot.influence.ivreg}
\alias{influencePlot.ivreg}
\alias{influencePlot.influence.ivreg}
\alias{infIndexPlot.ivreg}
\alias{infIndexPlot.influence.ivreg}
\alias{model.matrix.influence.ivreg}
\alias{avPlots.ivreg}
\alias{avPlot.ivreg}
\alias{mcPlots.ivreg}
\alias{mcPlot.ivreg}
\alias{Boot.ivreg}
\alias{crPlots.ivreg}
\alias{crPlot.ivreg}
\alias{ceresPlots.ivreg}
\alias{ceresPlot.ivreg}
\alias{plot.ivreg}
\alias{outlierTest.ivreg}
\alias{spreadLevelPlot.ivreg}
\alias{ncvTest.ivreg}
\alias{deviance.ivreg}
\alias{dfbeta.ivreg}
\alias{influence.rivreg}
\title{Deletion and Other Diagnostic Methods for \code{"ivreg"} Objects}
\usage{
\method{influence}{ivreg}(
  model,
  sigma. = n <= 1000,
  type = c("stage2", "both", "maximum"),
  applyfun = NULL,
  ncores = NULL,
  ...
)

\method{rstudent}{ivreg}(model, ...)

\method{cooks.distance}{ivreg}(model, ...)

\method{dfbeta}{influence.ivreg}(model, ...)

\method{dfbeta}{ivreg}(model, ...)

\method{hatvalues}{ivreg}(model, type = c("stage2", "both", "maximum", "stage1"), ...)

\method{rstudent}{influence.ivreg}(model, ...)

\method{hatvalues}{influence.ivreg}(model, ...)

\method{cooks.distance}{influence.ivreg}(model, ...)

\method{qqPlot}{influence.ivreg}(
  x,
  ylab = paste("Studentized Residuals(", deparse(substitute(x)), ")", sep = ""),
  distribution = c("t", "norm"),
  ...
)

\method{influencePlot}{ivreg}(x, ...)

\method{influencePlot}{influence.ivreg}(model, ...)

\method{infIndexPlot}{ivreg}(model, ...)

\method{infIndexPlot}{influence.ivreg}(model, ...)

\method{model.matrix}{influence.ivreg}(object, ...)

\method{avPlots}{ivreg}(model, terms, ...)

\method{avPlot}{ivreg}(model, ...)

\method{mcPlots}{ivreg}(model, terms, ...)

\method{mcPlot}{ivreg}(model, ...)

\method{Boot}{ivreg}(
  object,
  f = coef,
  labels = names(f(object)),
  R = 999,
  method = "case",
  ncores = 1,
  ...
)

\method{crPlots}{ivreg}(model, terms, ...)

\method{crPlot}{ivreg}(model, ...)

\method{ceresPlots}{ivreg}(model, terms, ...)

\method{ceresPlot}{ivreg}(model, ...)

\method{plot}{ivreg}(x, ...)

\method{qqPlot}{ivreg}(x, distribution = c("t", "norm"), ...)

\method{outlierTest}{ivreg}(x, ...)

\method{influencePlot}{ivreg}(x, ...)

\method{spreadLevelPlot}{ivreg}(x, main = "Spread-Level Plot", ...)

\method{ncvTest}{ivreg}(model, ...)

\method{deviance}{ivreg}(object, ...)

\method{influence}{rivreg}(model, ...)
}
\arguments{
\item{model, x, object}{A \code{"ivreg"} or \code{"influence.ivreg"} object.}

\item{sigma.}{If \code{TRUE} (the default for 1000 or fewer cases), the deleted value
of the residual standard deviation is computed for each case; if \code{FALSE}, the
overall residual standard deviation is used to compute other deletion diagnostics.}

\item{type}{If \code{"stage2"} (the default), hatvalues are for the second stage regression;
if \code{"both"}, the hatvalues are the geometric mean of the casewise hatvalues for the
two stages; if \code{"maximum"}, the hatvalues are the larger of the casewise
hatvalues for the two stages. In computing the geometric mean or casewise maximum hatvalues,
the hatvalues for each stage are first divided by their average (number of coefficients in
stage regression/number of cases); the geometric mean or casewise maximum values are then
multiplied by the average hatvalue from the second stage.}

\item{applyfun}{Optional loop replacement function that should work like
\code{\link[base]{lapply}} with arguments \code{function(X, FUN, ...)}. The default
is to use a loop unless the \code{ncores} argument is specified (see below).}

\item{ncores}{Numeric, number of cores to be used in parallel computations. If set
to an integer the \code{applyfun} is set to use either \code{\link[parallel:clusterApply]{parLapply}}
(on Windows) or
#ifdef windows
\code{\link[parallel:mcdummies]{mclapply}}
#endif
#ifdef unix
\code{\link[parallel]{mclapply}}
#endif
(otherwise) with the desired number of cores.}

\item{...}{arguments to be passed down.}

\item{ylab}{The vertical axis label.}

\item{distribution}{\code{"t"} (the default) or \code{"norm"}.}

\item{terms}{Terms for which added-variable plots are to be constructed; the default,
if the argument isn't specified, is the \code{"regressors"} component of the model formula.}

\item{f, labels, R}{see \code{\link[car]{Boot}}.}

\item{method}{only \code{"case"} (case resampling) is supported: see \code{\link[car]{Boot}}.}

\item{main}{Main title for the graph.}
}
\value{
In the case of \code{influence.ivreg}, an object of class \code{"influence.ivreg"}
with the following components:
\describe{
\item{\code{coefficients}}{the estimated regression coefficients}
\item{\code{model}}{the model matrix}
\item{\code{dfbeta}}{influence on coefficients}
\item{\code{sigma}}{deleted values of the residual standard deviation}
\item{\code{dffits}}{overall influence on the regression coefficients}
\item{\code{cookd}}{Cook's distances}
\item{\code{hatvalues}}{hatvalues}
\item{\code{rstudent}}{Studentized residuals}
\item{\code{df.residual}}{residual degrees of freedom}
}
In the case of other methods, such as \code{rstudent.ivreg} or
\code{rstudent.influence.ivreg}, the corresponding diagnostic statistics.
Many other methods (e.g., \code{crPlot.ivreg}, \code{avPlot.ivreg}, \code{Effect.ivreg})
draw graphs.
}
\description{
Methods for computing deletion and other regression diagnostics for 2SLS regression.
It's generally more efficient to compute the deletion diagnostics via the \code{influence}
method and then to extract the various specific diagnostics with the methods for
\code{"influence.ivreg"} objects. Other diagnostics for linear models, such as
added-variable plots (\code{\link[car]{avPlots}}) and component-plus-residual
plots (\code{\link[car]{crPlots}}), also work, as do effect plots
(e.g., \code{\link[effects]{predictorEffects}}) with residuals (see the examples below).
The pointwise confidence envelope for the \code{\link[car]{qqPlot}} method assumes an independent random sample
from the t distribution with degrees of freedom equal to the residual degrees of
freedom for the model and so are approximate, because the studentized residuals aren't
independent.

For additional information, see the vignette
\href{../doc/Diagnostics-for-2SLS-Regression.pdf}{Diagnostics for 2SLS Regression}.
}
\examples{
kmenta.eq1 <- ivreg(Q ~ P + D | D + F + A, data = Kmenta)
summary(kmenta.eq1)
car::avPlots(kmenta.eq1)
car::mcPlots(kmenta.eq1)
car::crPlots(kmenta.eq1)
car::ceresPlots(kmenta.eq1)
car::influencePlot(kmenta.eq1)
car::influenceIndexPlot(kmenta.eq1)
car::qqPlot(kmenta.eq1)
car::spreadLevelPlot(kmenta.eq1)
plot(effects::predictorEffects(kmenta.eq1, residuals = TRUE))
set.seed <- 12321 # for reproducibility
confint(car::Boot(kmenta.eq1, R = 250)) # 250 reps for brevity
car::outlierTest(kmenta.eq1)
car::ncvTest(kmenta.eq1)

}
\seealso{
\code{\link{ivreg}}, \code{\link[car]{avPlots}},
  \code{\link[car]{crPlots}}, \code{\link[effects]{predictorEffects}},
  \code{\link[car]{qqPlot}}, \code{\link[car]{influencePlot}},
  \code{\link[car]{infIndexPlot}}, \code{\link[car]{Boot}},
  \code{\link[car]{outlierTest}}, \code{\link[car]{spreadLevelPlot}},
  \code{\link[car]{ncvTest}}.
}
